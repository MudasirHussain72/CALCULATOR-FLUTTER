// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

// ignore: camel_case_types
class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var result = "";
  Widget btn(var txt) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFd9985b), // background
          onPrimary: Colors.black, // foreground
        ),
        onPressed: () {
          setState(() {
            result = result + txt;
          });
        },
        child: Text(txt));
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFd9985b),
        title: Center(
            child: Text(
          "CALCULATOR",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      backgroundColor: Color(0xffbce8de),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          height: 300,
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                result,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("1"),
                  btn("2"),
                  btn("3"),
                  btn("4"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("5"),
                  btn("6"),
                  btn("7"),
                  btn("8"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("9"),
                  btn("0"),
                  btn("+"),
                  btn("-"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("*"),
                  btn("/"),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFd9985b), // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: clear,
                      child: Text("clear")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFd9985b), // background
                        onPrimary: Colors.black, // foreground
                      ),
                      onPressed: output,
                      child: Text("=")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
