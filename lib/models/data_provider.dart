import 'package:flutter/material.dart';
import 'package:note_taking/models/data_brain.dart';

class DataProvider extends ChangeNotifier {
  List<DataBrain> getData = [
    DataBrain(
        "Going to the gym", "Tomorrow I'm going to the gym.", Colors.pink),
    DataBrain("Computer Games", "Tomorrow I'm going to play Comuter games.",
        Colors.orange),
    DataBrain(
        "Reading Books", "Tomorrow I'm going to read books.", Colors.blue),
  ];

  void addNewData(String title, String description, Color color) {
    getData.add(
      DataBrain(
        title,
        description,
        color,
      ),
    );
    notifyListeners();
  }
}
