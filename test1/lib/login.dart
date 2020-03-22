import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'dart:io';
// import 'package:gradient_text/gradient_text.dart';

class LoginPage extends StatefulWidget{
    @override
    LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>{
    String input = "";
    var tries = 4;

    final Shader loginTxt1 = LinearGradient(
        colors: <Color>[const Color(0xff12c2e9),const Color(0xfff64f59)],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    void _over(){
        showDialog(context: context,
            builder: (BuildContext context){
                return AlertDialog(
                    title: new Text("YOU WASTED YOUR CHANCE..."),
                    content: new Text("Good bye"),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    actions: <Widget>[
                        new FlatButton(onPressed: () => exit(0), child: new Text("EXIT")),
                    ],
                );
            }
        );
    }

    void _wrongPass(){
        showDialog(context: context,
            builder: (BuildContext context){
                return AlertDialog(
                    title: new Text("WRONG PASSWORD"),
                    content: new Text("You have $tries attempts remaining"),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    actions: <Widget>[
                        new FlatButton(onPressed: () => Navigator.pop(context), child: new Text("TRY AGAIN")),
                    ],
                );
            }
        );
    }

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

    @override
    Widget build(BuildContext context){
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
        ));
        SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
        ]);
        return new Scaffold(
            backgroundColor: const Color(0xff000000),
            resizeToAvoidBottomInset: false,
            body: new Stack(
                children: <Widget>[
                    new Container(
                        decoration: new BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/desk3.jpg')
                            ),
                        )
                    ),

                    new Positioned.fill(
                        child: new Container(
                            height: MediaQuery.of(context).size.height ,
                            // h-350
                            decoration: BoxDecoration(
                                color: Colors.white,
                                gradient: LinearGradient(
                                    begin: FractionalOffset.topCenter,
                                    end: FractionalOffset.bottomCenter,
                                    colors: [
                                        const Color(0xffef32d9).withOpacity(0.4),
                                        const Color(0xff89fffd).withOpacity(0.5),
                                    ],
                                    stops: [
                                        0.0,
                                        1.0
                                ]),
                            )
                        ),
                    ),

                    new Center(
                        child: Column(
                            children: [
                                new Container(
                                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
                                    width: MediaQuery.of(context).size.width * 0.84,
                                    height: MediaQuery.of(context).size.height * 0.44,
                                    child: new Card(
                                        color: Colors.black.withOpacity(0.2),
                                        child: new Container(
                                            margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.08),
                                            child: new Column(
                                                children: [
                                                    new Text(
                                                        "Seculator",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: MediaQuery.of(context).size.width * 0.12,
                                                            fontFamily: 'Kiona',
                                                        ),
                                                    ),
                                                    new SizedBox(height: MediaQuery.of(context).size.height*0.005),
                                                    new Text(
                                                        "The secret calculator app\ndeveloped just for us",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.white.withOpacity(0.7),
                                                            fontFamily: "Kiona",
                                                            fontSize: MediaQuery.of(context).size.width * 0.04,
                                                        ),
                                                    ),
                                                    new Container(
                                                        margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                                                        width: MediaQuery.of(context).size.width*0.74,
                                                        height: MediaQuery.of(context).size.height*0.2,
                                                        child: new Card(
                                                            color: Colors.white.withOpacity(0.6),
                                                            child: new Column(
                                                                children: <Widget>[
                                                                    new Container(
                                                                        margin: EdgeInsets.fromLTRB(20,20,20,20),
                                                                        child: new TextFormField( 
                                                                            obscureText: true,
                                                                            keyboardType: TextInputType.number,
                                                                            textAlign: TextAlign.center,
                                                                            decoration: InputDecoration(
                                                                                hintText: "Password?",
                                                                                border: new UnderlineInputBorder(
                                                                                    borderSide: new BorderSide(
                                                                                        color: Colors.yellow,
                                                                                    )
                                                                                ),
                                                                            ),
                                                                            style: TextStyle(
                                                                                color: Colors.blueGrey,
                                                                                fontWeight: FontWeight.w100,
                                                                            ),
                                                                            onChanged: (String value){
                                                                                setState(() {
                                                                                    input = value;
                                                                                });
                                                                            },
                                                                        ),
                                                                    ),
                                                                    new Container(
                                                                        width: MediaQuery.of(context).size.width*0.62,
                                                                        height: MediaQuery.of(context).size.height*0.055,
                                                                        child: new RaisedButton(
                                                                            color: const Color(0xffb21f66),
                                                                            child: new Text(
                                                                                "GO!",
                                                                                style: TextStyle(
                                                                                    fontFamily: "Kiona",
                                                                                    color: Colors.white,
                                                                                    fontSize: 24,
                                                                                ),    
                                                                            ),
                                                                            onPressed:(){
                                                                                setState(() {
                                                                                    if(input == "2020"){
                                                                                        Navigator.pushNamed(context, "/About");
                                                                                    }
                                                                                    else {
                                                                                        if(tries>1){
                                                                                            tries--;
                                                                                            _wrongPass();
                                                                                        }
                                                                                        else {
                                                                                            _over();
                                                                                            exit(0);
                                                                                        }
                                                                                    }
                                                                                });
                                                                            }
                                                                        ),
                                                                    )
                                                                ],
                                                            ),
                                                        ),
                                                    )
                                                ]
                                            )
                                        ),
                                    )
                                )
                            ]
                        )
                    ),
                    
                    new Positioned(
                        // top: 120,
                        // left: 136,
                        top: MediaQuery.of(context).size.height * 0.15,
                        left: MediaQuery.of(context).size.width * 0.37,
                        child: new CircleAvatar(
                            radius: 45,
                            backgroundImage: AssetImage('assets/seculator.png'),
                            backgroundColor: const Color(0xffb21f66),
                        ),
                    ),

                    new Positioned(
                        top: MediaQuery.of(context).size.height * 0.82,
                        // top: 650,
                        left: MediaQuery.of(context).size.width * 0.09,
                        // left: 33,
                        child: new Column(
                            children: <Widget>[
                                new SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    // width: 290,
                                    child: new RaisedButton(
                                        color: const Color(0xffb21f66).withOpacity(0.8),
                                        onPressed:()=> _exitApp(),
                                        child: new Text(
                                            "What password? Lemme go!",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.04,
                                                fontFamily: "Kiona",
                                                color: Colors.white,
                                            ),
                                        )
                                    ),
                                ),
                                new SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    // width: 290,
                                    child: new RaisedButton(
                                        onPressed:()=> Navigator.pushNamed(context, "/About"),
                                        child: new Text(
                                            "I know no password, but can I go in?",
                                            style: TextStyle(
                                                fontSize: MediaQuery.of(context).size.width * 0.04,
                                                fontFamily: "Kiona",
                                                color: const Color(0xffb21f66),
                                            ),
                                        )
                                    )
                                ),
                            ],
                        ),
                    ),

                ],
            ),
        );
    }
}