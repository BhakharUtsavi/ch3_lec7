import 'package:ch3_lec7/screen/eigthtask.dart';
import 'package:ch3_lec7/screen/eleventask.dart';
import 'package:ch3_lec7/screen/fifthtask.dart';
import 'package:ch3_lec7/screen/firsttask.dart';
import 'package:ch3_lec7/screen/fourtask.dart';
import 'package:ch3_lec7/screen/homepage.dart';
import 'package:ch3_lec7/screen/ninetask.dart';
import 'package:ch3_lec7/screen/secondtask.dart';
import 'package:ch3_lec7/screen/seventask.dart';
import 'package:ch3_lec7/screen/sixtask.dart';
import 'package:ch3_lec7/screen/tentask.dart';
import 'package:ch3_lec7/screen/thirdtask.dart';
import 'package:ch3_lec7/screen/twelvetask.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context){
          return HomePage();
        },
        "firsttask":(context){
          return FirstTask();
        },
        "secondtask":(context){
          return SecondTask();
        },
        "thirdtask":(context){
          return ThirdTask();
        },
        "fourtask":(context){
          return FourTask();
        },
        "fifthtask":(context){
          return FifthTask();
        },
        "sixtask":(context){
          return SixTask();
        },
        "seventask":(context){
          return SevenTask();
        },
        "eigthtask":(context){
          return EigthTask();
        },
        "ninetask":(context){
          return NineTask();
        },
        "tentask":(context){
          return TenTask();
        },
        "eleventask":(context){
          return ElevenTask();
        },
        "twelvetask":(context){
          return TwelveTask();
        },
      },
    ),
  );
}