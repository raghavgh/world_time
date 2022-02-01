import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print('build function');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        elevation: 0,
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text(
          '$counter',
        ),
      ),
    );
  }
}
