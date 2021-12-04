// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue.shade50,
        textTheme: TextTheme(
            headline1: const TextStyle(
                fontSize: 172.0,
                fontWeight: FontWeight.w300,
                color: Colors.blue),
            headline6:
                const TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(
                fontSize: 172.0,
                fontWeight: FontWeight.w300,
                color: Colors.blue.shade200,
                fontFamily: 'Hind')),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _random = Random();
  double next(double min, double max) =>
      _random.nextDouble() * (max - min) + min;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerHeader(
          child: Text("Settings"),
        ),
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
          onDoubleTap: () => Scaffold.of(context).openDrawer(),
          child: Stack(children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Pointer(
                incrementAction: _incrementCounter, loseAction: _resetCounter),
            Pointer(
                incrementAction: _incrementCounter, loseAction: _resetCounter),
          ]),
        );
      }),
    );
  }
}

class Pointer extends StatefulWidget {
  final Function incrementAction;
  final Function loseAction;

  const Pointer(
      {Key? key, required this.incrementAction, required this.loseAction})
      : super(key: key);

  @override
  State<Pointer> createState() => _PointerState();
}

final _random = Random();
double next(double min, double max) => _random.nextDouble() * (max - min) + min;

class _PointerState extends State<Pointer> {
  double xAxis = 0;
  double yAxis = 0;

  void randomize() {
    setState(() {
      xAxis = next(-0.87, 1.03);
      yAxis = next(-0.8, 1);
    });
    print(xAxis);
    print(yAxis);
    widget.incrementAction();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
          child: FloatingActionButton(
            onPressed: randomize,
            tooltip: 'Increment',
            child: const Icon(
              Icons.add_circle_outline_rounded,
              size: 55,
            ),
          ),
          alignment: Alignment(xAxis, yAxis)),
    );
  }
}
