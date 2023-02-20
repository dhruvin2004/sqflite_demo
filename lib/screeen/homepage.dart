import 'package:flutter/material.dart';
import 'package:sqflite_demo/modal/helpermodal.dart';
import 'package:sqflite_demo/screeen/homepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataBase in Sqflite"),
      ),
      body: Center(
        child: Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            // insert a data
            MaterialButton(
              color: Colors.green,
              onPressed: () async{
                print("Insert");
                Map<String,dynamic> row = {
                  DatabaseHelper.columnName : "Dhruvin",
                  DatabaseHelper.columnAge : "19",
                };

                final isInserted = await dbHelper.insert(row);

                print("Inserted row is : $isInserted");
              },
              child: Text("Insert"),
            ),

            // read a Data
            MaterialButton(
              color: Colors.blue,
              onPressed: () async{
                final list = await dbHelper.queryAllRows();
                print(list);
              },
              child: Text("Read"),
            ),
          ],
        ),
      ),
    );
  }
}
