"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.activate = activate;
exports.deactivate = deactivate;
const vscode = __importStar(require("vscode"));
const axios_1 = __importDefault(require("axios")); // for making the HTTP requests
const path = __importStar(require("path"));
const fs = __importStar(require("fs"));
// This method is called when the extension is activated
function activate(context) {
    // The command has been defined in the package.json file
    // The commandId parameter must match he command field in package.json for properly registering the command
    let disposable = vscode.commands.registerCommand('java-to-cobol-convertor.convert', async () => {
        // extract the currently active text editor
        const editor = vscode.window.activeTextEditor;
        if (!editor) {
            vscode.window.showErrorMessage("No active editor found. Please open a Java file to run the extension");
            return;
        }
        const document = editor.document;
        if (document.languageId !== 'java') {
            vscode.window.showErrorMessage("This command only works for Java files.");
            return;
        }
        // Scrape the entire Java code from the file open
        const javaCode = document.getText();
        // vscode.window.showInformationMessage('Converting Java to COBOL ...');
        await vscode.window.withProgress({
            location: vscode.ProgressLocation.Notification,
            title: "Converting Java to COBOL...",
            cancellable: false // we cannot stop the process once initiated. API calls are not that useless bro !!!!!
        }, async (progress) => {
            try {
                // make a POST request to the API (local or deployed)
                const response = await axios_1.default.post('https://java-to-cobol.onrender.com/convert', {
                    javaCode: javaCode
                });
                const cobolCode = response.data.cobolCode;
                // Write the generated cobol code to a new file
                const workSpaceFolders = vscode.workspace.workspaceFolders;
                if (!workSpaceFolders) {
                    vscode.window.showErrorMessage('Please open a folder in VS code to save the output file');
                    return;
                }
                const workSpacePath = workSpaceFolders[0].uri.fsPath;
                const cobolOutputPath = path.join(workSpacePath, 'finalCobolCode.cbl');
                fs.promises.writeFile(cobolOutputPath, cobolCode, 'utf8');
                // Open the newly created file automatically 
                const fileUri = vscode.Uri.file(cobolOutputPath);
                const newDocument = await vscode.workspace.openTextDocument(fileUri);
                await vscode.window.showTextDocument(newDocument);
                vscode.window.showInformationMessage('COBOL code generated and opened successfully!');
            }
            catch (error) {
                console.error(error);
                vscode.window.showErrorMessage('Failed to convert Java to COBOL. Make sure the local API server is running.');
            }
        });
    });
    context.subscriptions.push(disposable);
}
function deactivate() { }
//# sourceMappingURL=extension.js.map