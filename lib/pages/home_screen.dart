import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();
  Color _color1 = Color(0x87E65E06);
  Color _color2 = Color(0xFFFE245A);

  void changeColor() {
    setState(() {
      _color1 = Color.fromRGBO(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextDouble(),
      );
      _color2 = Color.fromARGB(
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              // без градієнта
              //   child: InkWell(
              //   onTap: changeColor,
              //   child: Container(
              //     color: _color,
              //   ),
              // ),
              child: InkWell(
                onTap: changeColor,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        _color1,
                        _color2,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        Text(
                          'hey there',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'RubikMonoOne',
                              fontSize: 35.0),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        'tap to change color',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'RubikMonoOne',
                            fontSize: 14.0,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                'exit the program',
                style: TextStyle(
                  fontFamily: 'RubikMonoOne',
                  fontSize: 14.0,
                  color: Colors.black,
                ),
              ),
              content: Text(
                'are you sure?',
                style: TextStyle(
                  fontFamily: 'RubikMonoOne',
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => exit(0),
                  child: Text(
                    'yes',
                    style: TextStyle(
                      fontFamily: 'RubikMonoOne',
                      fontSize: 14,
                    ),
                  ),
                  // style: TextButton.styleFrom(
                  //   elevation: 5,
                  //   shadowColor: Colors.teal,
                  //   primary: Colors.white,
                  //   backgroundColor: Colors.teal,
                  // ),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(
                    'no',
                    style: TextStyle(
                      fontFamily: 'RubikMonoOne',
                      fontSize: 14,
                    ),
                  ),
                  // style: TextButton.styleFrom(
                  //   elevation: 5,
                  //   shadowColor: Colors.red,
                  //   primary: Colors.white,
                  //   backgroundColor: Colors.red,
                  // ),
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
