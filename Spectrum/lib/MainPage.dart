import 'dart:io';
import 'package:my_app/Emotions.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'live.dart';
import 'main.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF78cdff),
      appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/Full_Logo.PNG',
            fit: BoxFit.contain,
            height: 60,
          )),
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(children: <Widget>[
          SizedBox(
            height: 30,
          ),

          InkWell(
            onTap: () {
              print('Proceeding to Upload...');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Upload()),
              );
            },
            splashColor: Colors.white.withOpacity(0.5),
            child: Ink(
              height: 175,
              width: 355,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/UploadBtn.PNG'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          //Image.asset('assets/UploadBtn.PNG'),
          SizedBox(height: 50),

          InkWell(
            onTap: () {
              print('');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Live()),
              );
            },
            splashColor: Colors.white.withOpacity(0.5),
            child: Ink(
              height: 175,
              width: 375,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/LiveBtn.png'), fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(height: 50),

          InkWell(
            onTap: () {
              print('Proceeding to Feelings & Emotions Chart...');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmotionsChart()),
              );
            },
            splashColor: Colors.white.withOpacity(0.5),
            child: Ink(
              height: 175,
              width: 355,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/EmotionsChartBtn.PNG'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          //Image.asset('assets/MainPageBtn.PNG'),

          //Container(
          //    decoration: BoxDecoration(color: Color(0xFFd6e5ec)),
          //    alignment: Alignment.center,
          //    height: 150,
          //    width: 300,
          //    ),
        ]),
      )),
    );
  }
}
