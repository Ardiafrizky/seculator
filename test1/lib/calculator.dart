import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatorPage extends StatefulWidget{
    @override
    CalculatorPageState createState() => new CalculatorPageState();
}

class CalculatorPageState extends State<CalculatorPage>{
    FaIcon bulb = new FaIcon(FontAwesomeIcons.lightbulb);
    Color palette1 = Color(0xffff9d9d);
    Color palette2 = Color(0xffff2e63);
    Color bgpalette = Colors.white;
    Color cmdPalette = Color(0xffffffdd);
    Color display = Color(0xff381460);

    @override
    Widget build(BuildContext context){
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
        ));
        return new Scaffold(
            appBar: new AppBar(
                leading: new IconButton(
                    icon: new Icon(Icons.arrow_back_ios,size: 18,),
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                ),
                actions: <Widget>[
                    new IconButton(
                        icon: bulb,
                        onPressed: () { setState(() {
                            if(palette1 == Color(0xffff9d9d)){
                                bulb = FaIcon(FontAwesomeIcons.lightbulb,color: Color(0xffffe75e));
                                palette1 = new Color(0xff393e46);
                                palette2 = new Color(0xff21243d);
                                bgpalette = Color(0xff222831);
                                cmdPalette = Color(0xffffffdd);
                                display = Color(0xffffffdd);
                            } else {
                                bulb = FaIcon(FontAwesomeIcons.lightbulb);
                                palette1 = new Color(0xffff9d9d);
                                palette2 = new Color(0xffff2e63);
                                bgpalette = Colors.white;
                                cmdPalette = Color(0xffffffdd);
                                display = Color(0xff381460);
                            }
                        });},
                    ), 
                    new SizedBox(width:10)
                ],
                centerTitle: true,
                title: new Text("Calculator",
                    style: new TextStyle(
                        fontFamily: "Kiona",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                    ),
                ),
                flexibleSpace: new Container(
                    decoration: new BoxDecoration(
                        gradient: new LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [palette1,palette2],
                        ),
                    )
                ),
            ),
            body: new Container(
                child: new SimpleCalculator(
                    hideExpression: false,
                    theme: CalculatorThemeData(
                        borderWidth: 0,
                        commandColor: palette1,
                        expressionColor: const Color(0xfff1f3f4),
                        operatorColor: palette2,
                        displayColor: bgpalette,
                        numColor: bgpalette,
                        numStyle: TextStyle(fontSize:30,color: display),
                        commandStyle: TextStyle(fontSize: 30,color: cmdPalette),
                        operatorStyle: TextStyle(fontSize:30,color:Colors.white),
                        displayStyle: TextStyle(fontSize: 100, color: display),
                    ),
                )
            )
        );
    }
}