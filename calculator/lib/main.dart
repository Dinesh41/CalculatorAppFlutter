import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double num1, num2, calculatedOutput;
  String operator, output;

  _MyHomePageState() {
    calculatedOutput = 0;
    output = "0";
  }

  void onButtonPressed(String buttonText) {
    print(buttonText);
    switch (buttonText) {
      case "C":
        //Clear the data
        num1 = 0;
        num2 = 0;
        calculatedOutput = 0;
        output = "0";
        break;
      case "+":
      case "-":
      case "x":
      case "÷":
      case "%":
        //Store current output as num1 and update operator
        num1 = double.parse(output);
        operator = buttonText;
        output = "0";
        break;
      case ".":
        //Insert . if not already exist
        if (output.contains(".")) {
          //Toast error message
        } else {
          output += ".";
        }
        break;
      case "N":
        //Toast functionality not available
        break;
      case "=":
        // Do calculation
        num2 = double.parse(output);
        calculatedOutput = getCalculatedOutput();
        print(calculatedOutput);
        output = calculatedOutput.toString();
        break;
      default:
        print("Blah $output");
        //Append the number
        if (output == "0") {
          //If its already 0 don't append the number
          output = buttonText;
          break;
        }
        //Clean output if it contain text,reset the text
        RegExp regExp=RegExp('^[a-zA-Z]*');
        if (regExp.hasMatch(output)) {
          print("Matched");
          output = "";
        }
        output += buttonText;
    }
    setState(() {
      //To refresh the widget
    });
  }

  double getCalculatedOutput() {
    switch (operator) {
      case "+":
        //add the number
        return num1 + num2;
      case "-":
        //Subtract the number
        return num1 - num2;
      case "÷":
        //Divide the number
        return num1 / num2;
      case "x":
        //Multiply the number
        return num1 * num2;
      case "%":
        //Return remainder
        return num1 % num2;
      default:
      //Toast Wrong operator error
    }
  }

  Widget createButton(buttonText, int flex) {
    return Expanded(
      flex: flex,
      child: FlatButton(
        padding: EdgeInsets.all(15),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 25),
        ),
        onPressed: () => onButtonPressed(buttonText),
        color: Colors.blueGrey,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text(
                output,
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    createButton('C', 1),
                    createButton('N', 1),
                    createButton('%', 1),
                    createButton('÷', 1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    createButton('7', 1),
                    createButton('8', 1),
                    createButton('9', 1),
                    createButton('x', 1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    createButton('4', 1),
                    createButton('5', 1),
                    createButton('6', 1),
                    createButton('-', 1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    createButton('1', 1),
                    createButton('2', 1),
                    createButton('3', 1),
                    createButton('+', 1)
                  ],
                ),
                Row(
                  children: <Widget>[
                    createButton('0', 2),
                    createButton('.', 1),
                    createButton('=', 1),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//TODO
//1. decimal bug is there
//2. One operation missing
//3. UI perfection
//4. Add additional feature