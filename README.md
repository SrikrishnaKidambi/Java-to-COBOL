# Java2COBOL - Version : 1.0.

## About the tool :
- This project is a tool that converts a given Java Program into COBOL program. The convertion from Java to cobol is done using Rule-based method using the Java 14 grammar. We used the grammar files that are provided by ANTLR grammar repository. The conversion is being done from the Java program to an eqivalent COBOL 85 program.

- This tool can be used for generating a datasets for the cobol programs using the datasets that are present for the Java programs. Using these datasets, it is possible to train LLMs that are based on COBOL, they can be used for building LLMs that are based on COBOL.

- One of the limitation we are having in this current version of the project is - It is not possible to map all the Java constructs to equivalent COBOL constructs. For example, Java's Object Oriented Programming paradigm cannot be accurately mapped to an equivalent COBOL 85 constructs as the COBOL 85 does not have Object Oriented Programming paradigm.

- Future work of the tool includes extending the tool for suporting extended number of java constructs and also using the tool for cobol dataset generation.  

## Features of the tool :


## Steps of Tool :
- Use the Command for cloning the tool from the GitHub Repo : 
    ``` https://github.com/SrikrishnaKidambi/Java-to-COBOL.git ```
- Navigate to the tool repository using the command : ``` cd Java-to-COBOL  ```
- Compile the GUI files for Java : ``` javac ToolGUI.java```
- Navigate the backend code the tool and then compile the java code using the command 
    - For Windows : ``` javac -cp ".;antlr-4.13.2-complete.jar" *.java ```
    - For Linux/Mac : ``` javac -cp ".:antlr-4.13.2-complete.jar" *.java ```
- Navigate back to the root directory of the tool repository : ``` cd .. ```
- Use the command ``` java ToolGUI ``` to run the tool and follow the steps in the tool for using the tool.

## Steps to install dependencies :
- Install Java 14+ version. Link for installation of Java in your system : [Java]("https://www.oracle.com/java/technologies/javase/jdk22-archive-downloads.html")
- Installation of COBOL (GNU)in your system : [GNU COBOL]("https://sourceforge.net/projects/gnucobol/"). Installation of GNU COBOL is essential for executing the generated COBOL code. Follow the tutorial if needed : [COBOL Installation]("https://www.youtube.com/watch?v=u9M52sAnrOs"). 

## Steps for using the tool : 
- 

### Instructions to run the tool:
- To run this tool use the below command:
```terminal
java ToolGUI.java
```
