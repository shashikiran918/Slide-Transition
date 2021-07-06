import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _AnimatedCrossFadeExample(),
    );
  }
}

class _AnimatedCrossFadeExample extends StatefulWidget {
  @override
  _AnimatedCrossFadeExampleState createState() =>
      new _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<_AnimatedCrossFadeExample>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration:  Duration(seconds: 3),
      vsync: this,
    )
      ..forward();
    _animation = Tween<Offset>(
      begin:  Offset(-0.5, 0.0),
      end:  Offset(0.5, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInCubic,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SLIDE TRANSITION'),
        centerTitle: true,
      ),
      body: Builder(
          builder: (context) =>
              Center(
                child: SlideTransition(
                  position: _animation,
                  transformHitTests: true,
                  textDirection: TextDirection.ltr,
                  child: RaisedButton(
                    child: Text('SHASHI'),
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Button is pressed'))
                      );
                    },
                  ),
                ),
              )
      ),
    );
  }
}