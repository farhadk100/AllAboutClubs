import 'package:allaboutapps/Localisation/LanguageConstants.dart';
import 'package:allaboutapps/styles.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ErrorScreen extends StatefulWidget {
  final Function callBack;
  ErrorScreen({required this.callBack});
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150 / Styles.instance.pixelRatio,
            child: Icon(Icons.error, color: Colors.red, size: 150 / Styles.instance.pixelRatio,),
          ),
          Text(
            getTranslated(context, 'unknown_error'),
            style: Styles.instance.textStyle(),
          ),
          Padding(
            padding: EdgeInsets.only(top: Styles.instance.padding10),
            child: ElevatedButton(
              child: Text(
                getTranslated(context, 'try_again'),
                style: Styles.instance.textStyle(color: Colors.white),
              ),
              onPressed: (){
                widget.callBack();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Styles.instance.padding20)
                )),
                backgroundColor: MaterialStateProperty.all(Colors.blue)
              ),
            ),
          )
        ],
      ),
    );
  }
}
