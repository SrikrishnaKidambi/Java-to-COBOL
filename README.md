# Java2COBOL - Version : 1.0.

## About the tool :
- This project is a tool that converts a given Java Program into COBOL program. The convertion from Java to cobol is done using Rule-based method using the Java 14 grammar. We used the grammar files that are provided by ANTLR grammar repository. The conversion is being done from the Java program to an eqivalent COBOL 85 program.

- This tool can be used for generating a datasets for the cobol programs using the datasets that are present for the Java programs. Using these datasets, it is possible to train LLMs that are based on COBOL, they can be used for building LLMs that are based on COBOL.

- One of the limitation we are having in this current version of the project is - It is not possible to map all the Java constructs to equivalent COBOL constructs. For example, Java's Object Oriented Programming paradigm cannot be accurately mapped to an equivalent COBOL 85 constructs as the COBOL 85 does not have Object Oriented Programming paradigm.

- Future work of the tool includes extending the tool for suporting extended number of java constructs and also using the tool for cobol dataset generation.  

## Features of the tool :


## Steps of install Tool :
#### Follow the below steps to do the required set up for the tool and run it:
- Use the Command for cloning the tool from the GitHub Repo : 
    ``` git clone https://github.com/SrikrishnaKidambi/Java-to-COBOL.git ```
- Navigate to the tool repository using the command : ``` cd Java-to-COBOL  ```
- Navigate to ```cd Antlr``` and then compile the java code to set up the tool using the command 
    - For Windows : ``` javac -cp ".;antlr-4.13.2-complete.jar" *.java ```
    - For Linux/Mac : ``` javac -cp ".:antlr-4.13.2-complete.jar" *.java ```
- Navigate back to the root directory of the tool repository : ``` cd .. ```
- Compile the GUI files for Java : ``` javac ToolGUI.java```
- Use the command ``` java ToolGUI ``` to run the tool.
- **Once the above things are set up you can just navigate to the tool repo ```cd Java-to-COBOL``` and just run the command ``` java ToolGUI ```.**

## Steps to install dependencies :
- Install Java 14+ version. Link for installation of Java in your system : [Java](https://www.oracle.com/java/technologies/javase/jdk22-archive-downloads.html)
- Installation of COBOL (GNU)in your system : [GNU COBOL](https://sourceforge.net/projects/gnucobol/). Installation of GNU COBOL is essential for executing the generated COBOL code. Follow the tutorial if needed : [COBOL Installation](https://www.youtube.com/watch?v=u9M52sAnrOs). 

## Steps for using the tool : 
- Navigate to the tool repo ```cd Java-to-COBOL``` and just run the command ``` java ToolGUI ```.
- ![image](https://github.com/user-attachments/assets/e0da3b7c-8eb4-4df8-a3cc-23f5f9376b14)
- Using the upload button you can upload the java code which needs to be translated in the left part of GUI.
- You can also directly paste the code copied from any source in the left part without using upload button.
- ![image](https://github.com/user-attachments/assets/decb538b-ece9-4af5-a585-5387426c74da)
- Click the run button in the left part of GUI to start translation.
- Select your Operating system in the dialog box as the command to run Antlr differ in both(as seen above) and then you can see the COBOL code in the right part as below 👇.
- ![image](https://github.com/user-attachments/assets/85cb365f-9f68-4dc2-bd05-34b87e1044d3)
- ![image](https://github.com/user-attachments/assets/2c3fc567-1a2c-4806-afe8-ef34bb025cb4)
- You can copy the code onto the clipboard by clicking the copy button in the right side of GUI.
- You can also save the code by clicking the save button in the right side of GUI.

## Tool Demonstration video :
