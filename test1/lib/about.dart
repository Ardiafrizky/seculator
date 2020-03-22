import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:ui';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import "package:flutter/services.dart";
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class AboutPage extends StatefulWidget{
    @override
    AboutPageState createState() => new AboutPageState();
}

class AboutPageState extends State<AboutPage>{
    FaIcon bulb = new FaIcon(FontAwesomeIcons.lightbulb);
    Color currentTheme = new Color(0xffededed);
    var barIconClr = Brightness.dark;

    void _exitApp(){
        showDialog(context: context,
            builder: (BuildContext context){
                return AlertDialog(
                    title: new Text("Exit Seculator?"),
                    content: new Text("Are you sure you want to leave this awesome app?"),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    actions: <Widget>[
                        new FlatButton(onPressed: () => Navigator.pop(context), child: new Text("STAY")),
                        new FlatButton(onPressed: () => exit(0), child: new Text("CLOSE")),
                    ],
                );
            }
        );
    }

    void _launchURL(url) async {
        if (await canLaunch(url)) {
            await launch(url);
        } else {
            throw 'Couldn\'t launch $url';
        }
    }

    @override
    Widget build(BuildContext context){
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: currentTheme,
            statusBarIconBrightness: barIconClr,
        ));
        SystemChrome.setPreferredOrientations([
           DeviceOrientation.portraitUp,
           DeviceOrientation.portraitDown, 
        ]);
        return new Scaffold(
            body: new Stack(
                children: <Widget>[
                    new Container(
                        decoration: BoxDecoration(
                            color : currentTheme,
                        )
                    ),

                    new Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.038),
                        child: new Center(
                            child: new Column(children: <Widget>[
                                new IconButton(
                                    icon: bulb,
                                    onPressed: () { setState(() {
                                        if(currentTheme == Color(0xffededed)){
                                            bulb = FaIcon(FontAwesomeIcons.lightbulb,color: Color(0xffffe75e));
                                            currentTheme = Color(0xff21243d);
                                            barIconClr = Brightness.light;
                                        } else {
                                            bulb = FaIcon(FontAwesomeIcons.lightbulb);
                                            currentTheme = Color(0xffededed);
                                            barIconClr = Brightness.dark;
                                        }
                                    });},
                                ),  
                            ],)
                        ),
                    ),
                        // top: MediaQuery.of(context).size.height * 0.04,
                        // left: MediaQuery.of(context).size.width * 0.43,

                    new Positioned(
                        top: 632,
                        left: 115,
                        height: 70,
                        width: 120,
                        child: new Card(
                            elevation: 3,
                            color: Color(0xffededed),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)
                                ),
                            ),
                            child: new Column(
                                children: [
                                    new SizedBox(height:16),
                                    new GradientText(
                                        "AVI",
                                        textAlign: TextAlign.center,
                                        gradient: LinearGradient(
                                            colors: [const Color(0xffea168e), const Color(0xff612570)]
                                        ),
                                        style: TextStyle(
                                            fontFamily: 'Kiona',
                                            fontSize: 36,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    ),

                    new Positioned(
                        top: 570,
                        left: 46,
                        height: 70,
                        width: 260,
                        child: new Card(
                            color: const Color(0xfffffdf9),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30)
                                ),
                            ),
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                    new IconButton(
                                        icon: new FaIcon(FontAwesomeIcons.facebookF, color: Colors.blue,),
                                        onPressed: () => _launchURL('https://web.facebook.com/ardiaf.rizky?_rdc=1&_rdr'),
                                    ),
                                    new IconButton(
                                        icon: new FaIcon(FontAwesomeIcons.phoneAlt,size:20,color: Colors.green,),
                                        onPressed: () => _launchURL('tel:+62 812 844 338 05'),
                                    ),
                                    new IconButton(
                                        icon: new FaIcon(FontAwesomeIcons.linkedinIn, color: const Color(0xff2B56D3)),
                                        onPressed: () => _launchURL('https://www.linkedin.com/in/ardiaf-rizky-aula-944560174?originalSubdomain=id'),
                                    ),
                                    new IconButton(
                                        icon: new FaIcon(FontAwesomeIcons.instagram, color: const Color(0xffb21f66)),
                                        onPressed: () => _launchURL('https://www.instagram.com/ardiafrizky24/'),
                                    ),
                                ],
                            )
                        ),
                    ),

                    new Positioned(
                        top: 624,
                        left: 156,
                        child: new Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color(0xffd45079),
                                borderRadius: new BorderRadius.circular(5.0),
                            ),
                            child: new Text("a.k.a",
                                style: new TextStyle(
                                    fontFamily: "Kiona",
                                    color: Colors.white,
                                ),
                            )
                        )    
                    ),

                    new Positioned(
                        // top: 90,
                        // left: 16,
                        // height: 50,
                        // width: 326,
                        top: MediaQuery.of(context).size.height * 0.1,
                        left: MediaQuery.of(context).size.width * 0.1,
                        child: new Card(
                            elevation: 7,
                            color: const Color(0xffeef2f5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                    new SizedBox(),
                                    new FlatButton(
                                        highlightColor: Colors.transparent,
                                        onPressed: () => _exitApp(),
                                        child: new Icon(Icons.exit_to_app),
                                    ),
                            
                                    new Text(
                                        "PROFILE",
                                        style: new TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Kiona",
                                            color: const Color(0xffea168e),
                                        ),
                                    ),
                                    
                                    new FlatButton(
                                        focusColor: Colors.transparent,
                                        onPressed: () => Navigator.pushNamed(context, "/Calculator"),
                                        child: new FaIcon(FontAwesomeIcons.calculator,size: 18,),
                                    ),
                                    new Padding(padding: EdgeInsets.only(left:2),),
                                ],
                            )
                        ),
                    ),

                    new Positioned(
                        top: 140,
                        left: 8,
                        width: 340,
                        height: 460,
                        child: new Stack(
                            children: [
                                new Container(
                                    foregroundDecoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        backgroundBlendMode: BlendMode.saturation,
                                    ),
                                    child: new Card(
                                        semanticContainer: true,
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        child: Image.asset(
                                            'assets/avi2.jpg',
                                            fit: BoxFit.cover
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        elevation: 9,
                                        margin: EdgeInsets.all(10),
                                    ),
                                ),

                                new Positioned(
                                    top: 10,
                                    left: 10,
                                    child: new Container(
                                        width: 320,
                                        height: 427.0,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.circular(30.0),
                                            gradient: LinearGradient(
                                                begin: FractionalOffset.topCenter,
                                                end: FractionalOffset.bottomCenter,
                                                colors: [
                                                    const Color(0xffef32d9).withOpacity(0.1),
                                                    Colors.black.withOpacity(0.5),
                                                ],
                                                stops: [
                                                    0.0,
                                                    1.0
                                            ]),
                                        )
                                    ),
                                ),
                            ]
                        )
                    ),

                    new Positioned(
                        top: 170,
                        left: 36,
                        width: 280,
                        height: 60, 
                        child: new ClipRect(
                            child: new BackdropFilter(
                                filter: ImageFilter.blur(sigmaX:1,sigmaY:1),
                                child: new Container(
                                    // width: 200,
                                    // height: 200,
                                    decoration: new BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: new BorderRadius.circular(30.0)
                                    ),
                                ),
                            ),
                        )
                    ),

                    new Positioned(
                        top: 184,
                        left: 60,
                        child: new GradientText("Ardiaf Rizky Aula",
                            gradient: LinearGradient(
                                colors: [const Color(0xffea168e), const Color(0xff612570)]
                            ),
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "Kiona"),
                            textAlign: TextAlign.center,
                        ),
                    ),

                    new Positioned(
                        top: 490,
                        left: 70,
                        child: new Column(
                            children: <Widget>[
                                new Text("Gamer.Coder.Reader",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Kiona",
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                                new SizedBox(height: 5,),
                                new Text("mobile developer",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Kiona",
                                        fontSize: 16,
                                    ),
                                ),
                                new Text("ui/ux",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Kiona",
                                        fontSize: 16,
                                    ),
                                )
                            ]
                        ),
                    ),
                ]
            ),
        );
    }
}