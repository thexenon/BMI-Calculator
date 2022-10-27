import 'dart:ui';

import 'package:flutter001/cons/app_cons.dart';
import 'package:flutter001/widgets/left_bar.dart';
import 'package:flutter001/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _heightCont = TextEditingController();
  TextEditingController _weightCont = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accentColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                child: TextField(
                  controller: _heightCont,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Height/m",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
                ),
              ),
              Container(
                width: 230,
                child: TextField(
                  controller: _weightCont,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: accentColor,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Weight/KG",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white.withOpacity(.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                double _h = double.parse(_heightCont.text);
                double _w = double.parse(_weightCont.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You're over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You're under weight";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                  ),
                ),
              )),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 90,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Visibility(
            visible: _textResult.isNotEmpty,
            child: Container(
              child: Text(
                _textResult,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          LeftBar(barWidth: 40),
          SizedBox(
            height: 10,
          ),
          LeftBar(barWidth: 70),
          SizedBox(
            height: 10,
          ),
          LeftBar(barWidth: 90),
          SizedBox(
            height: 10,
          ),
          RightBar(barWidth: 90),
          SizedBox(
            height: 10,
          ),
          RightBar(barWidth: 70),
          SizedBox(
            height: 10,
          ),
          RightBar(barWidth: 40),
        ],
      )),
    );
  }
}
