// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_2/test.dart';
import 'package:math_expressions/math_expressions.dart';

class Calc extends StatefulWidget {
  const Calc({super.key});

  @override
  State<StatefulWidget> createState() => _CalcStat();
}

class _CalcStat extends State<Calc> {
  double num1 = 0.0;
  double num2 = 0.0;
  var input = '';
  var output = '';
  var op = '';
  var hide = false;
  var outputSize = 34.0;
  var b = Colors.black;
  var b2 = Icons.light_mode;
  onBtnClick(value) {
    try {
      if (value == "AC") {
        input = '';
        output = '';
      } else if (value == "<") {
        if (input.isNotEmpty) {
          input = input.substring(0, input.length - 1);
        }
      } else if (value == "=") {
        if (input.isNotEmpty &&
            (input[0] != "*" ||
                input[0] != "+" ||
                input[0] != "-" ||
                input[0] != "/")) {
          var userInput = input;
          userInput = input.replaceAll("x", "*");
          Parser p = Parser();
          Expression ex = p.parse(userInput);
          ContextModel cm = ContextModel();
          var finalValue = ex.evaluate(EvaluationType.REAL, cm);
          output = finalValue.toString();
          if (output.endsWith(".0")) {
            output = output.substring(0, output.length - 2);
          }
          input = output;
          hide = true;
          outputSize = 60;
        }
      } else {
        input += value;
        hide = false;
        outputSize = 34;
      }
      // ignore: empty_catches
    } on Exception {}

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: b,
        appBar: AppBar(
          backgroundColor: MainColor.mainColor2,
          leading: ElevatedButton(
            onPressed: () => setState(() {
              b = b == Colors.black ? Colors.white : Colors.black;
              b2 = b2 == Icons.light_mode ? Icons.mode_night : Icons.light_mode;
            }),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MainColor.mainColor2)),
            child: Icon(b2),
          ),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text(
              "My Calculator",
              style: TextStyle(
                color: MainColor.mainColor1,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                color: b,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      hide ? " " : input,
                      style: TextStyle(
                        fontSize: 48,
                        color: b == Colors.black ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      output,
                      style: TextStyle(
                        fontSize: outputSize,
                        color: b == Colors.black
                            ? Colors.white.withOpacity(.7)
                            : Colors.black.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                btn(
                    txt: "AC",
                    tcolor: MainColor.mainColor1,
                    tbackground: MainColor.mainColor3),
                btn(
                    txt: "<",
                    tcolor: MainColor.mainColor1,
                    tbackground: MainColor.mainColor3),
                btn(txt: "%", tcolor: MainColor.mainColor1,tbackground: MainColor.mainColor3),
                btn(
                    txt: "/",
                    tcolor: MainColor.mainColor1,
                    tbackground: MainColor.mainColor3),
              ],
            ),
            Row(
              children: [
                btn(
                  txt: "7",
                ),
                btn(txt: "8"),
                btn(txt: "9"),
                btn(
                    txt: "*",
                    tcolor: MainColor.mainColor1,
                    tbackground: MainColor.mainColor3),
              ],
            ),
            Row(
              children: [
                btn(txt: "4"),
                btn(txt: "8"),
                btn(txt: "6"),
                btn(
                    txt: "-",
                    tcolor: MainColor.mainColor1,
                    tbackground: MainColor.mainColor3),
              ],
            ),
            Row(
              children: [
                btn(txt: "1"),
                btn(txt: "2"),
                btn(txt: "3"),
                btn(
                    txt: "+",
                    tcolor: MainColor.mainColor1,
                    tbackground: MainColor.mainColor3),
              ],
            ),
            Container(
              child: Row(
                children: [
                  btn(txt: "0"),
                  btn(txt: "."),
                  btn(txt: "=", tbackground: MainColor.mainColor1),
                ],
              ),
            ),
          ],
        ));
  }

  Widget btn({txt, tcolor = Colors.white, tbackground = MainColor.mainColor2}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(7),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: tbackground,
              padding: const EdgeInsets.all(18),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: () => onBtnClick(txt),
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 25,
              color: tcolor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
