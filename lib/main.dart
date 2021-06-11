import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          title: Text('Weather Forecast'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _citySearch(),
              _cityDetail(),
            ],
          ),
        ))
      ],
    ),
  );
}

class _cityDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Murmansk Oblast, RU',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Friday, Mar 20, 2020',
            style: TextStyle(
              // fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _citySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: InputBorder.none,
        // fillColor: Colors.white,
        icon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        hintText: 'Enter City Name',
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
