import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ResultPage({
    @required this.result,
    @required this.gender,
    @required this.height,
    @required this.weight,
    @required this.age,
  });
  static const String id = 'ResultPage';
  double? result;
  String? gender;
  double? height;
  int? weight;
  int? age;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            customButton(col: Color(0xffF8942F), txt: 'You are is $gender'),
            customButton(col: Color(0xffF8942F), txt: 'Your Height is $height'),
            customButton(col: Color(0xffF8942F), txt: 'Your Weight is $weight'),
            customButton(col: Color(0xffF8942F), txt: 'Your age is $age'),
            SizedBox(
              height: 20,
            ),
            customButton(
                col: Color(0xff3B8715),
                txt: 'Your result is ${result!.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }

  Padding customButton({required String txt, required Color col}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: col,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Center(
              child: Text(
                txt,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
    );
  }
}
