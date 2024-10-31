import 'package:flutter/material.dart';

void main() {
  runApp(ColorPickerApp());
}

class ColorPickerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ColorPickerHomePage(),
    );
  }
}

class ColorPickerHomePage extends StatefulWidget {
  @override
  _ColorPickerHomePageState createState() => _ColorPickerHomePageState();
}

class _ColorPickerHomePageState extends State<ColorPickerHomePage> {
  double red = 0;
  double green = 0;
  double blue = 0;

  Color get currentColor => Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              color: currentColor,
            ),
            SizedBox(height: 20),
            buildColorSlider('Red', red, (value) {
              setState(() {
                red = value;
              });
            }),
            buildColorSlider('Green', green, (value) {
              setState(() {
                green = value;
              });
            }),
            buildColorSlider('Blue', blue, (value) {
              setState(() {
                blue = value;
              });
            }),
          ],
        ),
      ),
    );
  }

  Widget buildColorSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      children: [
        Text('$label: ${value.toInt()}'),
        Slider(
          value: value,
          min: 0,
          max: 255,
          activeColor: Colors.deepPurple,
          inactiveColor: Colors.grey,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
