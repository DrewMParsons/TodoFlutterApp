import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonMain extends StatelessWidget {
  final String buttonText;
  final Function onPress;

  ButtonMain({@required this.buttonText, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(0.0),
      color: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Theme.of(context).accentColor)),
      onPressed: onPress,
      child: Container(
        width: 200.0,
        padding: EdgeInsets.all(10.0),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 30.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
