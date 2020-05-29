import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'Range Slider';

  double _lowValue = 10.0;
  double _highValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _lowValue.toString(),
                    style: TextStyle(fontSize: 32.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _highValue.toString(),
                    style: TextStyle(fontSize: 32.0),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: RangeSlider(
                min: 0.0,
                max: 100.0,
                divisions: 10,
                inactiveColor: Color(0xFFFBE0E6),
                activeColor: Color(0xFFC41A3B),
                labels: RangeLabels(_lowValue.toString(), _highValue.toString()),
                values: RangeValues(_lowValue, _highValue),
                onChanged: (_range) {
                  setState(() {
                    _lowValue = _range.start;
                    _highValue = _range.end;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
