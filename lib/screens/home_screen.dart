import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:note_taking/models/data_provider.dart';
import 'package:note_taking/screens/detail_screen.dart';
import 'package:note_taking/screens/dispaying_data.dart';
import 'package:note_taking/screens/new_data.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note Taking"),
        backgroundColor: Colors.amber,
      ),
      body: GridView.builder(
        itemCount: Provider.of<DataProvider>(context).getData.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          final data = Provider.of<DataProvider>(context).getData;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    data[index].title,
                    data[index].description,
                  ),
                ),
              );
            },
            child: DisplayData(
              data[index].title,
              data[index].description,
              data[index].color,
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Container(
                    height: 350,
                    width: 400,
                    child: NewData(),
                  ),
                );
              });
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
