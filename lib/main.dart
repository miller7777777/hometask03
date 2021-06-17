import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
              _temperatureDetail(),
              _extraWeatherDetail(),
              _sevenDayWeatherTitle(),
              _bottomDetail(),
            ],
          ),
        ))
      ],
    ),
  );
}

class _bottomDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

// Widget _myListView() {
//   return ListView(
//     padding: EdgeInsets.all(8.0),
//     // shrinkWrap: true,
//     // scrollDirection: Axis.horizontal,
//     // itemExtent: 300,
//     children: [
//       ListTile(
//         title: Text('XXX'),
//         leading: Icon(Icons.insert_photo, color: Colors.red),
//         trailing: Icon(Icons.keyboard_arrow_left),
//       ),
//       ListTile(
//         title: Text('XXX'),
//         leading: Icon(Icons.insert_photo, color: Colors.red),
//         trailing: Icon(Icons.keyboard_arrow_left),
//       ),
//       ListTile(
//         title: Text('XXX'),
//         leading: Icon(Icons.insert_photo, color: Colors.red),
//         trailing: Icon(Icons.keyboard_arrow_left),
//       ),
//     ],
//   );
// }

Widget _myListView() {
  final List<String> items = List<String>.generate(7, (i) => 'Item $i');
  final List<String> daysOfWeek = [
    'Friday',
    'Saturday',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday'
  ];

  final List<int> temperatures = [5, 6, 22, 18, 7, 7, 7];
  return Container(
    height: 120,
    width: double.infinity,
    // width: 300,
    child: ListView.builder(
      itemExtent: 160,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return BottomDetailItem(
          daysOfWeek: daysOfWeek,
          index: index,
          temp: temperatures,
        );
      },
    ),
  );
}

class BottomDetailItem extends StatelessWidget {
  const BottomDetailItem(
      {required this.daysOfWeek, required this.index, required this.temp});

  final List<String> daysOfWeek;
  final int index;
  final List<int> temp;

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          // side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(0),
        ),
        // color: Color(0xffe57373),
        color: Color(0xffffcdd2).withOpacity(0.8),
        // color: Colors.pink[200],
        // color: Colors.red[200],
        // color: Colors.transparent,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 8.0, right: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${daysOfWeek[index]}',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${temp[index]} °F',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                      size: 36.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _sevenDayWeatherTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '7-DAY WEATHER FORECAST',
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class _extraWeatherDetail extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Icon(
                Icons.ac_unit_sharp,
                color: Colors.white,
                size: 32.0,
              ),
              Text(
                '5',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                'km/hr',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.ac_unit_sharp,
                color: Colors.white,
                size: 32.0,
              ),
              Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '%',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.ac_unit_sharp,
                color: Colors.white,
                size: 32.0,
              ),
              Text(
                '20',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '%',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _temperatureDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.wb_sunny,
                color: Colors.white,
                size: 64.0,
              ),
            ],
          ),
          SizedBox(
            width: 16.0,
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  Text(
                    '14 °F',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'LIGHT SNOW',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
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
