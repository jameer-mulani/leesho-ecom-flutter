import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecom_app/leesho_app.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]).then((value) => runApp(const LeeshoApp()));

}