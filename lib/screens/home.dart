import 'package:bmi_app/screens/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomePage({super.key});
  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String gender;
  bool cToggle = true;
  int weight = 80;
  int age = 20;
  double height = 173;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculate')),
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customTopButton(type: 'Male'),
                customTopButton(type: 'Female'),
              ],
            ),
            bodySlider(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customDownButton(txt: 'Weight'),
                  customDownButton(txt: 'Age'),
                ],
              ),
            ),
            calculateButton(),
          ],
        ),
      ),
    );
  }

// ---------------   calculateButton --------------------------
  GestureDetector calculateButton() {
    return GestureDetector(
      onTap: () {
        double myResult = weight / pow(height / 100, 2);

        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return ResultPage(
                result: myResult,
                gender: gender,
                height: height,
                weight: weight,
                age: age);
          }),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xff3B8715),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Calculate',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
//---------------  bodySlider -----------------------------

  Padding bodySlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffF8942F),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Height',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    height.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 60,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    ' Cm',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Slider(
                  thumbColor: Colors.white,
                  activeColor: Color(0xff3B8715),
                  divisions: 270,
                  min: 90,
                  max: 225,
                  value: height,
                  onChanged: (val) {
                    setState(() {
                      height = val;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

//-------------  customTopButton  ---------------------------------

  Padding customTopButton({required String type}) {
    String text = type;
    gender = text;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              setState(() {
                cToggle = text == 'Male' ? true : false;
                gender = text;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (cToggle && text == 'Male') ||
                        (!cToggle && text == 'Female')
                    ? Color(0xffF8942F)
                    : Color(0xff848F92),
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  children: [
                    Icon(
                      text == 'Male' ? Icons.male : Icons.female,
                      color: Colors.white,
                      size: 60,
                    ),
                    Text(
                      text,
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

//-------------  customDownButton  ---------------------

  Padding customDownButton({required String txt}) {
    String text = txt;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Builder(
        builder: (context) {
          return Container(
            width: MediaQuery.of(context).size.width / 2.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF8942F),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      text == 'Weight' ? '$weight' : '$age',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                          heroTag: text == 'Weight' ? 'btn1' : 'btn2',
                          backgroundColor: Colors.white,
                          child: Icon(
                            size: 28,
                            Icons.add,
                            color: Color(0xff3B8715),
                          ),
                          mini: true,
                          onPressed: () {
                            setState(() {
                              text == 'Weight' ? weight++ : age++;
                            });
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      FloatingActionButton(
                          heroTag: text == 'Weight' ? 'btn3' : 'btn4',
                          backgroundColor: Colors.white,
                          child: Icon(
                            size: 28,
                            Icons.remove,
                            color: Color(0xff3B8715),
                          ),
                          mini: true,
                          onPressed: () {
                            setState(() {
                              text == 'Weight' ? weight-- : age--;
                            });
                          }),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
