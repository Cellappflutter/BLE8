import 'package:flutter/material.dart';

class CellButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  const CellButton({Key key, @required this.text, @required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   RaisedButton(
                          elevation: 12.0,
                          color: Color.fromRGBO(52, 152, 249, 1),
                          // splashColor: Colors.blue[50],
                          textColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 21),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0))),
                          child: Text(
                            this.text.toUpperCase(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          onPressed: this.onpressed,);
                            
                          }
    
  }
