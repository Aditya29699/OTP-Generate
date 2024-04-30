//import 'dart:js';

//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp/otp.dart';
import 'package:phone_otp/phone.dart';
import 'package:phone_otp/main.dart';


void main()  {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp( MaterialApp(
    initialRoute: 'phone',
    routes: {
      'phone':(context)=> MyPhone(),
      'otp':(context)=>MyOtp(),
    },
  ));
}

