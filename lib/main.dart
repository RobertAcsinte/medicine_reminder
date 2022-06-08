import 'package:flutter/material.dart';
import 'package:medicine_reminder/screens/amount_medicine/amount_medicine.dart';
import 'package:medicine_reminder/screens/moment_list/moment_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Reminder',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        dividerColor: Colors.transparent,
      ),
      home: const MainPageState(),

    );
  }
}

class MainPageState extends StatelessWidget {
  const MainPageState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          title: const Text("Medicine Reminder"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Overview'),
              Tab(text: 'Week of 7th January')
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MomentList(),
            AmountMedicineWidget(),
          ],
        )
      ),
    );
  }
}
