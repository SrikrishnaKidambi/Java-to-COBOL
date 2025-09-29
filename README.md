# Java2COBOL - Version : 1.0.

[Tool website link](https://srikrishnakidambi.github.io/Java-to-COBOL/)
## About the tool :
- This project is a tool that converts a given Java Program into COBOL program. The convertion from Java to cobol is done using Rule-based method using the Java 14 grammar. We used the grammar files that are provided by ANTLR grammar repository. The conversion is being done from the Java program to an eqivalent COBOL 85 program.

- One of the limitation we are having in this current version of the project is - It is not possible to map all the Java constructs to equivalent COBOL constructs. For example, Java's Object Oriented Programming paradigm cannot be accurately mapped to an equivalent COBOL 85 constructs as the COBOL 85 does not have Object Oriented Programming paradigm.

- Future work of the tool includes extending the tool for suporting extended number of java constructs.  

## Features of the tool :
- **Parse Tree generation:** For the given java source code using the java grammar it constructs the parse tree.
- **Code translation:** Translates the java code into equivalent cobol code using the rule based translation approach. We have currently implemented rule based mapping for arithmetic expressions (including int, float, double, long, char, String etc.,), arrays, conditional statements (if-else if-else blocks, switch case), loops, methods.
- **Graphical User Interface:** Our tool has a GUI that has options to upload the java code for translation and also options to copy and save the translated cobol code.
## Uses/Goals of the tool :
- JAVA2COB is a tool that is developed to do the rule based translation of java code to COBOL code, as many developers today are unaware of COBOL language which is used in many legacy systems their maintainance is a challenge and also LLMs perform bad in understanding and fixing bugs in COBOL code. So our tool helps the developers to write code in java and convert it to cobol and use it for maintainance purposes.
- An API was built and hosted on cloud platform (Render) that accepts a POST request. It takes Java code in the request and returns the converted COBOL code. For the tool to be made available for users without getting Java installed on their system, we made a docker container that maintains the environment required for the tool to convert the input Java code.
- A website was built with backend being the API built for this project. The website is hosted at the following link : [ Website link](https://java2cob-rishalab.onrender.com/). Following are the features of the website :
      - User will be able to upload a Java file for which the conversion will be made and the generated COBOL code will be displayed on website.
      - User will be able to write the Java code on the website and get the conversion done.
      - User will be able to copy the generated COBOL code or will be able to save the generated COBOL code.
  Image of the website :
  <img width="1919" height="909" alt="image" src="https://github.com/user-attachments/assets/0e3a5a7f-74ce-4909-83fe-eebb202f12e1" />

- A vs code extension was also built using the API built using this tool. The extension has been published in the VS code market place with the name : java-to-cobol-convertor. It can be downloaded from the link : [Extension Link](https://marketplace.visualstudio.com/items?itemName=SaiKrishnaBrahmajosyula.java-to-cobol-convertor).

## Working of tool :
<img width="1248" height="561" alt="image" src="https://github.com/user-attachments/assets/3c0fed40-7c35-4162-8fcc-4fe6cbf0e9e6" />


**Key phases in the tool:**

**1)** **Initial set up for the tool:**
The antlr tool will take in the Java 14 grammar as input and provides the java parser and java lexer. We got the java parser and lexer from antlr repo and antlr4 jar from their website. These were the prerequisites for the generation of AST/Parse Tree.

**2) Workflow of the tool:**
When the java source code is given to the tool firstly it is tokenized by the lexer which is called as lexical analysis which converts the code into tokens and those tokens are given to the java parser and it creates the parse tree. An instance of parse tree walker can be created and we can pass the parse tree and custom listener to it to walk the nodes of the parse tree and convert the java constructs into cobol constructs thereby we get the translated cobol code.

**3) Workflow of the code translation:**
We have analysed the data division and procedure division of the code seperately. So one parse tree walker walks through the nodes and returns the identification and data division of the cobol code and the other parse tree walker walks through the nodes and returns procedure division of the code.

**4) Evaluation of code translation:**
Once the cobol code is generate using GNU cobol we compiled and executed the code and similarly used java compiler for java code and compared the output to test the correctness of the tool.

**5) Contructs our tool supports:**
We have currently implemented rule based mapping for arithmetic expressions (including int, float, double, long, char, String etc.,), arrays, conditional statements (if-else if-else blocks, switch case), loops, methods and some intrinsic(library) functions available in cobol.

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
    - For Windows : ``` javac -cp ".;antlr-4.13.2-complete.jar;javaparser-core-3.25.8.jar" *.java ```
    - For Linux/Mac : ``` javac -cp ".:antlr-4.13.2-complete.jar:javaparser-core-3.25.8.jar" *.java ```
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

## Tool Demonstration Video:

[Watch on Youtube](https://www.youtube.com/watch?v=_93LDvXTkT0)

## Contributors :
- Sai Krishna Brahmajosyula
- Srikrishna Kidambi
- Sridhar Chimalakonda
