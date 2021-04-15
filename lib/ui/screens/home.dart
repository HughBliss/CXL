import 'package:cxl/ui/common/text.dart';
import 'package:cxl/ui/components/primary_action_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: Center(
          child: Text(
            widget.title,
            style: CxlText.HeroHeading,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: CxlText.Text,
            ),
            Text(
              '$_counter',
              style: CxlText.SecondaryHeading,
            ),
          ],
        ),
      ),
      floatingActionButton: PrimaryActionButton(
        'Add',
        icon: Icons.add,
        callback: _incrementCounter,
      ),
    );
  }
}
