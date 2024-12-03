import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreenWidget(),
    );
  }
}

class FirstScreenWidget extends StatefulWidget {
  @override
  _FirstScreenWidgetState createState() => _FirstScreenWidgetState();
}

class _FirstScreenWidgetState extends State<FirstScreenWidget> {
  String _inputText = '';
  double _fontSize = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Лаба 10'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Введіть текст',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    _inputText = text;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Font size: ${_fontSize.toInt()}'),
                  Expanded(
                    child: Slider(
                      value: _fontSize,
                      min: 10.0,
                      max: 50.0,
                      divisions: 40,
                      label: _fontSize.toInt().toString(),
                      onChanged: (value) {
                        setState(() {
                          _fontSize = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreenWidget(
                        text: _inputText,
                        fontSize: _fontSize,
                      ),
                    ),
                  );

                  String message;
                  if (result == 'Ok') {
                    message = 'Cool!';
                  } else if (result == 'Cancel') {
                    message = 'Let’s try something else';
                  } else {
                    message = 'Don’t know what to say';
                  }

                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
                            height: 50,
                          ),
                          SizedBox(height: 50),
                          Text(message, textAlign: TextAlign.center),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Preview'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreenWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  SecondScreenWidget({required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Другий екран'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: fontSize),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Ok');
                  },
                  child: Text('Ok'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
