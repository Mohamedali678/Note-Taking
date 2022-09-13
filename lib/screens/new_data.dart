import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:note_taking/models/data_provider.dart';
import 'package:provider/provider.dart';

class NewData extends StatefulWidget {
  @override
  State<NewData> createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  //const NewData({Key? key}) : super(key: key);
  String? _title;

  String? _descr;

  Color _color = Colors.tealAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Enter Title",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.2, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.2, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.2, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onChanged: (value) {
                _title = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter Description",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2.2, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2.2, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2.2, color: Colors.black),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onChanged: (value) {
                _descr = value;
              },
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              color: _color,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: _color,
                            onColorChanged: (value) {
                              setState(() {
                                _color = value;
                              });
                            },
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              setState(
                                () {
                                  _color = _color;
                                },
                              );
                              Navigator.pop(context);
                            },
                            child: Text("Got it"),
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.color_lens,
                size: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            color: Theme.of(context).primaryColor,
            height: 55,
            minWidth: double.infinity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            onPressed: () {
              Provider.of<DataProvider>(context, listen: false)
                  .addNewData(_title!, _descr!, _color);
              Navigator.pop(context);
            },
            child: const Text(
              "Save",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
