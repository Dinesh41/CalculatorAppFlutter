import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
#1f3147 -Bg Color 39 57 69
#817f82 -Bg 1 12,22,37
#5f6867 -Button Bg 1 83 ,91 ,94
#5f6867 -Button Bg 2 28 ,85 ,115
#817f82 -Button Bg 3 124 ,122 ,125
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color.fromRGBO(39, 57, 79, 1)),
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
    //Clean output if it contain text,reset the text
    RegExp regExp = RegExp('^[a-zA-Z]*\$');
    if (regExp.hasMatch(output)) {
      print("Matched");
      output = "0";
    }
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
      case '±':
        //change number to opposite sign
        double currentOutput = double.parse(output);
        output = (currentOutput > 0) ? "-$output" : output.substring(1);
        break;
      case ".":
        //Insert . if not already exist
        if (output.contains(".")) {
          //Toast error message
        } else {
          output += ".";
        }
        break;
      case "±":
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
        output += buttonText;
    }
  }

  double getCalculatedOutput() {
    //If no operator don't do anything
    if (operator == null) {
      return double.parse(output);
    }
    //Depend upon operator do calculation
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

  Widget createButton(buttonText, int flex, Color buttonColor) {
    return Expanded(
      flex: flex,
      child: FlatButton(
        padding: EdgeInsets.all(15),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 25),
        ),
        onPressed: () {
          setState(() {
            onButtonPressed(buttonText);
          });
        },
        color: buttonColor,
        textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(39, 57, 79, 1),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Color.fromRGBO(10, 18, 31, 1),
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                width: double.infinity,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    output,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 40),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      createButton('C', 1, Color.fromRGBO(85, 90, 94, 1)),
                      createButton('±', 1, Color.fromRGBO(85, 90, 94, 1)),
                      createButton('%', 1, Color.fromRGBO(85, 90, 94, 1)),
                      createButton('÷', 1, Color.fromRGBO(28, 85, 115, 1))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      createButton('7', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('8', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('9', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('x', 1, Color.fromRGBO(28, 85, 115, 1))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      createButton('4', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('5', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('6', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('-', 1, Color.fromRGBO(28, 85, 115, 1))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      createButton('1', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('2', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('3', 1, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('+', 1, Color.fromRGBO(28, 85, 115, 1))
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      createButton('0', 2, Color.fromRGBO(124, 122, 125, 1)),
                      createButton('.', 1, Color.fromRGBO(85, 90, 94, 1)),
                      createButton('=', 1, Color.fromRGBO(28, 85, 115, 1)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//TODO
//2. One operation missing
//3. UI perfection
//4. Add additional feature
