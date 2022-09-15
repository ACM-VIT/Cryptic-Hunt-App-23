warning: LF will be replaced by CRLF in android/build.gradle.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in lib/main.dart.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in pubspec.lock.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in pubspec.yaml.
The file will have its original line endings in your working directory
[1mdiff --git a/android/build.gradle b/android/build.gradle[m
[1mindex 83ae220..f33eab0 100644[m
[1m--- a/android/build.gradle[m
[1m+++ b/android/build.gradle[m
[36m@@ -1,5 +1,5 @@[m
 buildscript {[m
[31m-    ext.kotlin_version = '1.6.10'[m
[32m+[m[32m    ext.kotlin_version = '1.7.10'[m
     repositories {[m
         google()[m
         mavenCentral()[m
[1mdiff --git a/lib/main.dart b/lib/main.dart[m
[1mindex 53ab207..1094962 100644[m
[1m--- a/lib/main.dart[m
[1m+++ b/lib/main.dart[m
[36m@@ -1,44 +1,28 @@[m
[32m+[m[32mimport 'package:cryptic_hunt/screens/login.dart';[m
 import 'package:cryptic_hunt/screens/onBoarding.dart';[m
[32m+[m[32mimport 'package:cryptic_hunt/screens/sample.dart';[m
 import 'package:flutter/material.dart';[m
[32m+[m[32mimport 'package:shared_preferences/shared_preferences.dart';[m
 [m
 void main() {[m
[31m-  runApp(const MyApp());[m
[32m+[m[32m  runApp(const myApp());[m
[32m+[m[32m  // Navigator.pushNamed(context, ScreenTwoWidget.id);[m
 }[m
 [m
[31m-class MyApp extends StatelessWidget {[m
[31m-  const MyApp({super.key});[m
[32m+[m[32m// ignore: camel_case_types[m
[32m+[m[32mclass myApp extends StatelessWidget {[m
[32m+[m[32m  const myApp({Key? key}) : super(key: key);[m
 [m
[31m-  // This widget is the root of your application.[m
   @override[m
   Widget build(BuildContext context) {[m
     return MaterialApp([m
[31m-      title: 'Flutter Demo',[m
[31m-      theme: ThemeData([m
[31m-        primarySwatch: Colors.blue,[m
[31m-      ),[m
[31m-      home: const MyHomePage(),[m
[31m-    );[m
[31m-  }[m
[31m-}[m
[31m-[m
[31m-class MyHomePage extends StatelessWidget {[m
[31m-  const MyHomePage({Key? key}) : super(key: key);[m
[31m-[m
[31m-  @override[m
[31m-  Widget build(BuildContext context) {[m
[31m-    return Scaffold([m
[31m-      appBar: AppBar(title: const Text("Cryptic Hunt")),[m
[31m-      body: Container([m
[31m-        alignment: Alignment.center,[m
[31m-        child: TextButton([m
[31m-            onPressed: () {[m
[31m-              Navigator.push([m
[31m-                context,[m
[31m-                MaterialPageRoute(builder: (context) => const OnBoarding()),[m
[31m-              );[m
[31m-            },[m
[31m-            child: const Text("Scan")),[m
[31m-      ),[m
[32m+[m[32m      title: "Routes",[m
[32m+[m[32m      initialRoute: Login.id,[m
[32m+[m[32m      routes: {[m
[32m+[m[32m        Login.id: (context) => const Login(),[m
[32m+[m[32m        OnBoarding.id: (context) => const OnBoarding(),[m
[32m+[m[32m        Sample.id: (context) => const Sample(),[m
[32m+[m[32m      },[m
     );[m
   }[m
 }[m
[1mdiff --git a/lib/screens/onBoarding.dart b/lib/screens/onBoarding.dart[m
[1mindex 013e418..0263122 100644[m
[1m--- a/lib/screens/onBoarding.dart[m
[1m+++ b/lib/screens/onBoarding.dart[m
[36m@@ -1,8 +1,10 @@[m
[32m+[m[32mimport 'package:cryptic_hunt/screens/sample.dart';[m
 import 'package:flutter/material.dart';[m
 import 'package:flutter_svg/svg.dart';[m
 import 'package:smooth_page_indicator/smooth_page_indicator.dart';[m
 [m
 class OnBoarding extends StatelessWidget {[m
[32m+[m[32m  static String id = "OnBoarding";[m
   const OnBoarding({Key? key}) : super(key: key);[m
 [m
   @override[m
[36m@@ -11,19 +13,13 @@[m [mclass OnBoarding extends StatelessWidget {[m
       theme: ThemeData([m
         primarySwatch: Colors.blue,[m
       ),[m
[31m-      home: const OnBoardingPage(),[m
[32m+[m[32m      home: OnBoardingPage(),[m
     );[m
   }[m
 }[m
 [m
[31m-class OnBoardingPage extends StatefulWidget {[m
[31m-  const OnBoardingPage({Key? key}) : super(key: key);[m
[31m-[m
[31m-  @override[m
[31m-  State<OnBoardingPage> createState() => _OnBoardingPageState();[m
[31m-}[m
[31m-[m
[31m-class _OnBoardingPageState extends State<OnBoardingPage> {[m
[32m+[m[32mclass OnBoardingPage extends StatelessWidget {[m
[32m+[m[32m  OnBoardingPage({Key? key}) : super(key: key);[m
   final Widget svg1 = SvgPicture.asset('assets/onBoarding/a.svg');[m
   final Widget svg2 = SvgPicture.asset('assets/onBoarding/b.svg');[m
   final Widget svg3 = SvgPicture.asset('assets/onBoarding/c.svg');[m
[36m@@ -62,20 +58,24 @@[m [mclass _OnBoardingPageState extends State<OnBoardingPage> {[m
                 ),[m
               ],[m
             ),[m
[31m-            Expanded([m
[31m-              flex: 5,[m
[31m-              child: PageView([m
[31m-                controller: controller,[m
[31m-                scrollDirection: Axis.horizontal,[m
[31m-                children: [[m
[31m-                  svg1,[m
[31m-                  svg2,[m
[31m-                  svg3,[m
[31m-                ],[m
[32m+[m[32m            //TODO1: put text and SmoothPageIndicator in column inside expanded[m
[32m+[m[32m            Flexible([m
[32m+[m[32m              child: Container([m
[32m+[m[32m                constraints: const BoxConstraints([m
[32m+[m[32m                    minHeight: 200, minWidth: double.infinity),[m
[32m+[m[32m                child: PageView([m
[32m+[m[32m                  controller: controller,[m
[32m+[m[32m                  scrollDirection: Axis.horizontal,[m
[32m+[m[32m                  children: [[m
[32m+[m[32m                    svg1,[m
[32m+[m[32m                    svg2,[m
[32m+[m[32m                    svg3,[m
[32m+[m[32m                  ],[m
[32m+[m[32m                ),[m
               ),[m
             ),[m
[31m-            Expanded([m
[31m-              flex: 1,[m
[32m+[m[32m            Container([m
[32m+[m[32m              alignment: Alignment.topCenter,[m
               child: Column([m
                 children: [[m
                   const Text([m
[36m@@ -106,7 +106,8 @@[m [mclass _OnBoardingPageState extends State<OnBoardingPage> {[m
               ),[m
             ),[m
             Container([m
[31m-              margin: const EdgeInsets.all(20),[m
[32m+[m[32m              margin: const EdgeInsets.all(30),[m
[32m+[m[32m              alignment: Alignment.topCenter,[m
               child: ElevatedButton([m
                 onPressed: () {[m
                   double? currentpage = controller.page;[m
[36m@@ -117,6 +118,11 @@[m [mclass _OnBoardingPageState extends State<OnBoardingPage> {[m
                       duration: const Duration(milliseconds: 250),[m
                       curve: Curves.linear,[m
                     );[m
[32m+[m[32m                  } else {[m
[32m+[m[32m                    Navigator.push([m
[32m+[m[32m                        context,[m
[32m+[m[32m                        MaterialPageRoute([m
[32m+[m[32m                            builder: (context) => const Sample()));[m
                   }[m
                 },[m
                 style: ElevatedButton.styleFrom([m
[1mdiff --git a/lib/screens/sample.dart b/lib/screens/sample.dart[m
[1mindex e69de29..1795b30 100644[m
[1m--- a/lib/screens/sample.dart[m
[1m+++ b/lib/screens/sample.dart[m
[36m@@ -0,0 +1,33 @@[m
[32m+[m[32mimport 'package:flutter/material.dart';[m
[32m+[m
[32m+[m[32mclass Sample extends StatelessWidget {[m
[32m+[m[32m  static String id = "Sample";[m
[32m+[m[32m  const Sample({super.key});[m
[32m+[m
[32m+[m[32m  // This widget is the root of your application.[m
[32m+[m[32m  @override[m
[32m+[m[32m  Widget build(BuildContext context) {[m
[32m+[m[32m    return MaterialApp([m
[32m+[m[32m      title: 'Flutter