# Java2COBOL - Version : 1.0.

[Tool website link](https://srikrishnakidambi.github.io/Java-to-COBOL/)
## About the tool :
- This project is a tool that converts a given Java Program into COBOL program. The convertion from Java to cobol is done using Rule-based method using the Java 14 grammar. We used the grammar files that are provided by ANTLR grammar repository. The conversion is being done from the Java program to an eqivalent COBOL 85 program.

- This tool can be used for generating a datasets for the cobol programs using the datasets that are present for the Java programs. Using these datasets, it is possible to train LLMs that are based on COBOL, they can be used for building LLMs that are based on COBOL.

- One of the limitation we are having in this current version of the project is - It is not possible to map all the Java constructs to equivalent COBOL constructs. For example, Java's Object Oriented Programming paradigm cannot be accurately mapped to an equivalent COBOL 85 constructs as the COBOL 85 does not have Object Oriented Programming paradigm.

- Future work of the tool includes extending the tool for suporting extended number of java constructs and also using the tool for cobol dataset generation.  

## Features of the tool :
- **Parse Tree generation:** For the given java source code using the java grammar it constructs the parse tree.
- **Code translation:** Translates the java code into equivalent cobol code using the rule based translation approach. We have currently implemented rule based mapping for arithmetic expressions (including int, float, double, long, char, String etc.,), arrays, conditional statements (if-else if-else blocks, switch case), loops, methods.
- **Graphical User Interface:** Our tool has a GUI that has options to upload the java code for translation and also options to copy and save the translated cobol code.
## Uses/Goals of the tool :
- JAVA2COB is a tool that is developed to do the rule based translation of java code to COBOL code, as many developers today are unaware of COBOL language which is used in many legacy systems their maintainance is a challenge and also LLMs perform bad in understanding and fixing bugs in COBOL code. So our tool helps the developers to write code in java and convert it to cobol and use it for maintainance purposes. Also using this tool we can create datasets for COBOL and these datasets can be used to develop other tools as well as to train the LLMs and making LLMs capable to fix bugs in cobol codes, understand and generate good COBOL codes.
## Working of tool :
![image](https://github.com/user-attachments/assets/1a3877a7-b285-41f2-8f47-3486d94fcb49)
**Key phases in the tool:**

**1)** **Initial set up for the tool:**
The antlr tool will take in the Java 14 grammar as input and provides the java parser and java lexer. We got the java parser and lexer from antlr repo and antlr4 jar from their website. These were the prerequisites for the generation of AST/Parse Tree.

**2) Workflow of the tool:**
When the java source code is given to the tool firstly it is tokenized by the lexer which is called as lexical analysis which converts the code into tokens and those tokens are given to the java parser and it creates the parse tree. An instance of parse tree walker can be created and we can pass the parse tree and custom listener to it to walk the nodes of the parse tree and convert the java constructs into cobol constructs thereby we get the translated cobol code.

**3) Workflow of the code translation:**
We have analysed the data division and procedure division of the code seperately. So one parse tree walker walks through the nodes and returns the identification and data division of the cobol code and the other parse tree walker walks through the nodes and returns procedure division of the code.

**4) Contructs our tool supports:**
We have currently implemented rule based mapping for arithmetic expressions (including int, float, double, long, char, String etc.,), arrays, conditional statements (if-else if-else blocks, switch case), loops, methods.

## Contents in the tool Repository :
- The repo contains a folder called Antlr which has the antlr4 jar, java parser , java lexer and java parser listener classes.
- The Antlr folder contains class called Parse tree generation which is responsible to generate the parse tree and call the two other class, among them one returns the code for identification and data division and the other returns the code for procedure division. We are using the custom listener to make our rules for the code translation. The Test.java file is where the code from GUI is stored.
- The in main tool folder we can find final_cobol_code.cbl which stores the cobol code generated.
- Also the main tool folder contains the ToolGUI.java folder which launches the tool GUI and handles it's logic.
- The docs folder in the website branch contains the code for our tool website.

## Steps of install tool :
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

## Contributors :
- Sai Krishna Brahmajosyula
- Srikrishna Kidambi
- Sridhar Chimalakonda
