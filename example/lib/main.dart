import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shake Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _autoPlay = false;

  void _incrementCounter() {
    setState(() {
      _autoPlay = !_autoPlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHAKE ANIMATE'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30),
        children: [
          Wrap(
            spacing: 30,
            runSpacing: 30,
            children: [
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeDefaultConstant1(),ShakeDefaultConstant2()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeHardConstant1(),ShakeHardConstant2()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeSlowConstant1(),ShakeSlowConstant2()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeLittleConstant1(),ShakeLittleConstant2()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeHorizontalConstant1(),ShakeHorizontalConstant2()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeVerticalConstant1(),ShakeVerticalConstant2()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeRotateConstant1(),ShakeRotateConstant2()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeCrazyConstant1(),ShakeCrazyConstant2()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeOpacityConstant()]),
              ShakeItem(autoPlay: _autoPlay, shakeList: [ShakeChunkConstant()]),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'control animate play and pause',
          child: _autoPlay ? const Icon(Icons.pause) : const Icon(Icons.play_arrow)
      ),
    );
  }
}

class ShakeItem extends StatelessWidget {
  final bool autoPlay;
  final Duration? duration;
  final List<ShakeConstant> shakeList;
  const ShakeItem({Key? key,required this.shakeList,this.autoPlay = false,this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F3F5),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(shakeList.first.runtimeType.toString().replaceAll(RegExp(r'\d+'), ''),style: const TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: shakeList.map((shakeConstant){
              return ShakeWidget(
                duration: duration,
                shakeConstant: shakeConstant,
                autoPlay: autoPlay,
                child: Container(
                  width: 200,
                  height: 44,
                  color: Colors.primaries[Random().nextInt(18)],
                  alignment: Alignment.center,
                  child: Text(shakeConstant.runtimeType.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}