import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserProfileScreen(),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/Ellipse 404.png'),
            ),
            SizedBox(height: 10),
            Text(
              'Danilo Tanic',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('danilo@uscreen.tv', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text('Edit Your Profile')),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Streak',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  DropdownButton(
                    value: 'In a week',
                    items: [
                      DropdownMenuItem(
                        child: Text('In a week'),
                        value: 'In a week',
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Indicator(color: Colors.green, text: 'Practice'),
                  SizedBox(width: 10),
                  Indicator(color: Colors.red, text: 'No Practice'),
                ],
              ),
            ),
            SizedBox(height: 20),
            StreakChart(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.tune), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  Indicator({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 10, height: 10, color: color),
        SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}

class StreakChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: BarChart(
        BarChartData(
          barGroups: [
            makeGroupData(0, 2, 5),
            makeGroupData(1, 7, 0),
            makeGroupData(2, 6, 0),
            makeGroupData(3, 4, 0),
            makeGroupData(4, 2, 0),
            makeGroupData(5, 5.5, 2),
            makeGroupData(6, 7, 0),
          ],
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  List<String> days = [
                    'Mon',
                    'Tue',
                    'Wed',
                    'Thu',
                    'Fri',
                    'Sat',
                    'Sun',
                  ];
                  return Text(days[value.toInt()]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double practice, double noPractice) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: practice, color: Colors.green, width: 10),
        BarChartRodData(toY: noPractice, color: Colors.red, width: 10),
      ],
    );
  }
}
