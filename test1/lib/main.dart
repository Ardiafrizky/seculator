import 'package:flutter/material.dart';
import 'package:test1/about.dart';
import 'login.dart';
import 'about.dart';
import 'calculator.dart';

void main() {
    runApp(new MaterialApp(
        initialRoute: "/Login",
        routes: {
            "/Login": (BuildContext context) => new LoginPage(),
            "/About": (BuildContext context) => new AboutPage(),
            "/Calculator": (BuildContext context) => new CalculatorPage(),
        },
    ));
}
