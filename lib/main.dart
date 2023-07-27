import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  double _scale=0.5;
  AnimationController? _controller;
  @override

  void initState() {
    // TODO: implement initState
    _controller= AnimationController(duration: Duration(milliseconds: 500,), vsync: this,lowerBound: 0.0,upperBound: 0.1)..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  void _tapDown(TapDownDetails details){
    _controller?.forward();
  }
  void _tapUp(TapUpDetails details){
    _controller?.reverse();
  }
  Widget build(BuildContext context) {
    print("rebuild");
    return Scaffold(

      body: Center(
        child: GestureDetector(
          onTapDown: _tapDown,
          onTapUp: _tapUp,
          child: Transform.scale(
            scale: 1-_controller!.value,
            child: Container(
              height: 70,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blueAccent
              ),
              alignment: Alignment.center,
              child: const Text("Long Tap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
          ),

        ),
      ),

    );
  }
}

