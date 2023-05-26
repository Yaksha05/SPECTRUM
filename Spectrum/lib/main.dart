// import 'package:flutter/material.dart';
// import 'package:my_app/home.dart';
// import 'package:camera/camera.dart';

// List<CameraDescription>? cameras;
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   cameras = await availableCameras();
//   runApp(new MyApp());
// }

//  class MyApp extends StatelessWidget {
//   const MyApp({ Key ? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//       theme: ThemeData(primaryColor: Colors.deepPurple),
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }

import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/MainPage.dart';
import 'package:my_app/Emotions.dart';
import 'package:tflite/tflite.dart';

import 'home.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  //runApp(MyApp());
  runApp(MaterialApp(
    title: 'Named Route Navigation',
    theme: ThemeData(primaryColor: Colors.deepPurple),
    debugShowCheckedModeBanner: false,
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => HomePage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => MainPage(),
      '/third': (context) => TermsAndConditions(),
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF78cdff),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/Full_Logo.PNG',
              scale: 10.0,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.lightBlue),
            ),
            SizedBox(height: 30),
            CheckboxListTile(
              value: value,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (bool? newValue) {
                setState(() {
                  value = newValue ?? false;
                });
              },
              title: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: <TextSpan>[
                    TextSpan(text: "Please read the "),
                    TextSpan(
                      text: "terms of services",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle the tap gesture here
                          print("Terms of Services tapped!");
                          if (value == true) {
                            // Only handle tap if checkbox is checked
                            print("Terms of Services tapped!");
                            Navigator.pushNamed(context, '/third');
                          }
                        },
                    ),
                    TextSpan(text: " before using the app."),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                debugPrint('ElevatedButton Clicked');
                if (value == true) {
                  // Only navigate if checkbox is checked
                  Navigator.pushNamed(context, '/second');
                }
              },
              child: Text(
                'Welcome >>',
                style: TextStyle(fontSize: 40),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2F4AB6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TermsAndConditions extends StatelessWidget {
  TermsAndConditions({super.key});

  String header =
      'The following agreement regarding Spectrum: A Facial Emotion Recognition Mobile Application referred to as "The App" and anyone who is installing, accessing or in any other way using the software - referred to as "user".';
  String opening =
      'The User is under no obligation to utilize the app. However, where the user does so, this agreement is subject to any further limitations which may be set out in your support agreement.';
  String welcome =
      'Welcome to Spectrum: A Facial Emotion Recognition Mobile Application for those whom are afflicted with Autism Spectrum Disorder (ASD). This App is Designed to support individuals with ASD via Facial recognition of their emotions and other necessary features provided. These will outline the terms and conditions regarding the service(s) provided by the App. By downloading, installing, and the usage of the app, the user agree to be bound by these conditions, unless the user chooses to disagree, please refrain from using the app.';
  String acceptance = 'Acceptance of Terms';
  String desc1 =
      'By using the App, the user acknowledges and have read, understood, and agreed to abide by these Terms of Service. If the user is using the App on behalf of an organization or entity, the user represent and warrant the authority to bind that organization or entity to these terms.';
  String scope = 'Scope of Services';
  String desc2 =
      'The App provides facial emotion recognition capabilities and related features specifically designed to assist individuals with Autism Spectrum Disorder. The App may also include additional functionalities and services that aim to improve the user experience and support the intended purpose.';
  String privacy = 'Privacy and Data Collection';
  String desc3 =
      "Protecting the user's privacy and personal data is of utmost importance to us. By using the App, the user consent to the collection, storage, and use of the user's personal information as outlined in our Privacy Policy. We encourage the user to review the Privacy Policy to understand how we handle the user's data.";
  String responsibilities = 'User Responsibilities';
  String clauses1a =
      'a. Age Restrictions: The App is intended for individuals above the age of 8. If the user are under the age of 8, please refrain from using the App.';
  String clauses1b =
      'b. Compliance with Laws: the user agree to use the App to lawfully comply that is applicable to legal regulations, and these Terms of Service.';
  String clauses1c =
      "c. Account Security: the user are responsible for maintaining the confidentiality of any account information associated with the App and for all activities that occur under the user's account.";
  String clause1d =
      "d. Prohibited Activities: the user shall not engage in any activities that may interfere with or disrupt the functioning of the App, violate the rights of others, or contravene any applicable laws.";
  String intellectual = 'Intellectual Property';
  String liscence = 'b. License:';
  String clauses2a =
      'b1. The user may NOT repackage, translate, adapt, vary, modify, alter, create derivative works based upon, or integrate any other programs with, the app in whole or in part.';
  String clauses2b =
      'b2. The user may NOT use the app to engage in or allow others to engage in any illegal activity.';
  String clauses2c =
      "b3. The user may NOT transfer or assign the user's rights or obligations under this agreement to any person or authorize all or any part of the app to be copied on to another user's device.";
  String clauses2d =
      "b4. The user may NOT decompile, disassemble, reverse engineer or otherwise attempt to discover the source code of the app.";
  String clauses2e =
      "b5. The user are NOT permitted to grant any sub-licenses of the Product.";
  String limitation = 'Limitation of Liability';
  String clause3a =
      "a. Use of the App is at the user's own risk. We shall not be liable for any damages, losses, or liabilities arising out of or in connection with the user's use of the App.";
  String clause3b =
      "b. Indemnification: the user agree to indemnify and hold us harmless from any claims, losses, liabilities, or expenses arising from the user's usage of the App or violation of these Terms of Service.";
  String clause3c =
      "c. The software is distributed 'as is'. No warranty of any kind is expressed or implied. the user shall use at their own risk. the user will be liable for data loss, damages, loss of profits or any other kind of loss while using or misusing this software.";
  String modification = 'Modifications to the Terms of Service';
  String clause4 =
      "We reserve the right to modify these Terms of Service at any time. the user will be notified through the App or via other means. the user's continued use of the App following the modifications constitutes that the user accepts of the revised terms.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Terms and Condition'),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(header),
                SizedBox(height: 20),
                Text(opening),
                SizedBox(height: 20),
                Text(welcome),
                SizedBox(height: 20),
                Text(acceptance),
                SizedBox(height: 20),
                Text(desc1),
                SizedBox(height: 20),
                Text(scope),
                SizedBox(height: 20),
                Text(desc2),
                SizedBox(height: 20),
                Text(privacy),
                SizedBox(height: 20),
                Text(desc3),
                SizedBox(height: 20),
                Text(responsibilities),
                SizedBox(height: 20),
                Text(clauses1a),
                SizedBox(height: 20),
                Text(clauses1b),
                SizedBox(height: 20),
                Text(clauses1c),
                SizedBox(height: 20),
                Text(clause1d),
                SizedBox(height: 20),
                Text(intellectual),
                SizedBox(height: 20),
                Text(liscence),
                SizedBox(height: 20),
                Text(clauses2a),
                SizedBox(height: 20),
                Text(clauses2b),
                SizedBox(height: 20),
                Text(clauses2c),
                SizedBox(height: 20),
                Text(clauses2d),
                SizedBox(height: 20),
                Text(clauses2e),
                SizedBox(height: 20),
                Text(limitation),
                SizedBox(height: 20),
                Text(clause3a),
                SizedBox(height: 20),
                Text(clause3b),
                SizedBox(height: 20),
                Text(clause3c),
                SizedBox(height: 20),
                Text(modification),
                SizedBox(height: 20),
                Text(clause4),
              ],
            )));
  }
}

//Home
