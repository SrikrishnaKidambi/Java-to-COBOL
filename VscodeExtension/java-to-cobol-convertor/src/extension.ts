import * as vscode from 'vscode';
import axios from 'axios';   	// for making the HTTP requests
import * as path from 'path';
import * as fs from 'fs';

// This method is called when the extension is activated
export function activate(context: vscode.ExtensionContext){
	// The command has been defined in the package.json file
	// The commandId parameter must match he command field in package.json for properly registering the command

	let disposable = vscode.commands.registerCommand('java-to-cobol-convertor.convert',async ()=>{
		// extract the currently active text editor
		const editor = vscode.window.activeTextEditor;

		if(!editor){
			vscode.window.showErrorMessage("No active editor found. Please open a Java file to run the extension");
			return;
		}

		const document = editor.document;
		
		if(document.languageId!=='java'){
			vscode.window.showErrorMessage("This command only works for Java files.");
			return;
		}

		// Scrape the entire Java code from the file open

		const javaCode = document.getText();
		// vscode.window.showInformationMessage('Converting Java to COBOL ...');

		await vscode.window.withProgress({
			location:vscode.ProgressLocation.Notification,
			title: "Converting Java to COBOL...",
			cancellable: false // we cannot stop the process once initiated. API calls are not that useless bro !!!!!
		}, async(progress)=>{
			try{
				// make a POST request to the API (local or deployed)

				const response = await axios.post('https://java-to-cobol.onrender.com/convert',{
					javaCode:javaCode
				});

				const cobolCode = response.data.cobolCode;

				// Write the generated cobol code to a new file

				const workSpaceFolders = vscode.workspace.workspaceFolders;
				if(!workSpaceFolders){
					vscode.window.showErrorMessage('Please open a folder in VS code to save the output file');
					return;
				}

				const workSpacePath = workSpaceFolders[0].uri.fsPath;
				const cobolOutputPath = path.join(workSpacePath,'finalCobolCode.cbl');

				fs.promises.writeFile(cobolOutputPath,cobolCode,'utf8');

				// Open the newly created file automatically 

				const fileUri = vscode.Uri.file(cobolOutputPath);
				const newDocument = await vscode.workspace.openTextDocument(fileUri);
				await vscode.window.showTextDocument(newDocument);
				vscode.window.showInformationMessage('COBOL code generated and opened successfully!');
			}catch(error){
				console.error(error);
				vscode.window.showErrorMessage('Failed to convert Java to COBOL. Make sure the local API server is running.');
			}
		});
	});

	context.subscriptions.push(disposable);
}

export function deactivate() {}
