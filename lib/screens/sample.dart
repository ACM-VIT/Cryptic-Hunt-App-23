import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  static String id = "Sample";
  const Sample({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cryptic Hunt")),
      body: Container(
        alignment: Alignment.center,
        child: const Text("EMPTY"),
      ),
    );
  }
}
