import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double num1, num2, calculatedOutput;
  String operator, output;

  //Constructor to initialize default values
  _HomePageState() {
    calculatedOutput = 0;
    output = "0";
  }

  //To build the UI of the screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color.fromRGBO(39, 57, 79, 1),
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
                  Spacer(),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        createButton('C', 1, Color.fromRGBO(85, 90, 94, 1)),
                        createButton('±', 1, Color.fromRGBO(85, 90, 94, 1)),
                        createButton('%', 1, Color.fromRGBO(85, 90, 94, 1)),
                        createButton('÷', 1, Color.fromRGBO(28, 85, 115, 1))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        createButton('7', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('8', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('9', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('x', 1, Color.fromRGBO(28, 85, 115, 1))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        createButton('4', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('5', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('6', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('-', 1, Color.fromRGBO(28, 85, 115, 1))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        createButton('1', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('2', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('3', 1, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('+', 1, Color.fromRGBO(28, 85, 115, 1))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        createButton('0', 2, Color.fromRGBO(124, 122, 125, 1)),
                        createButton('.', 1, Color.fromRGBO(85, 90, 94, 1)),
                        createButton('=', 1, Color.fromRGBO(28, 85, 115, 1)),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //To create button
  Widget createButton(buttonText, int flex, Color buttonColor) {
    return Expanded(
      flex: flex,
      child: MaterialButton(
        height: double.infinity,
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 2, color: Color.fromRGBO(39, 57, 79, 1)),
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.all(15),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 25),
        ),
        onPressed: () {
          //Changing the state of the widget
          setState(() {
            onButtonPressed(buttonText);
          });
        },
        color: buttonColor,
        textColor: Colors.white,
      ),
    );
  }

  //Triggered when any button pressed in this screen
  void onButtonPressed(String buttonText) {
    //Clean output if it contain text,reset the text like Nah,Infinity
    RegExp regExp = RegExp('^[a-zA-Z]*\$');
    if (regExp.hasMatch(output)) {
      output = "0";
    }
    //Depend upon button clicked, take action
    switch (buttonText) {
      case "C":
        //Clear the data
        num1 = 0;
        num2 = 0;
        operator = null;
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
        //If output is 0 , dont do anything
        double currentOutput = double.parse(output);
        if (currentOutput == 0) {
          break;
        }
        //change number to opposite sign
        output = (currentOutput > 0) ? "-$output" : output.substring(1);
        break;
      case ".":
        //Insert . if not already exist
        if (output.contains(".")) {
          //Toast error message
          Fluttertoast.showToast(
              msg:
                  "Already decimal number exits, to remove decimal, click C button");
        } else {
          output += ".";
        }
        break;
      case "=":
        // Do calculation
        num2 = double.parse(output);
        calculatedOutput = getCalculatedOutput();
        output = calculatedOutput.toString();
        break;
      default:
        //Append the number
        if (output == "0") {
          //If its already 0 don't append the number
          output = buttonText;
          break;
        }
        output += buttonText;
    }
  }

  //To calculate output values
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
        Fluttertoast.showToast(msg: "Wrong Operator Found");
        return double.parse(output);
    }
  }
}
