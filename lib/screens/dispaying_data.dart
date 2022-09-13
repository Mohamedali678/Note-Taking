import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayData extends StatelessWidget {
  //const DisplayData({Key? key}) : super(key: key);

  final String title;
  final String decr;
  final Color color;

  DisplayData(this.title, this.decr, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            decr,
            maxLines: 3,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "${DateTime.now().year} -",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "${DateTime.now().month} -",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "${DateTime.now().day} -",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "${DateTime.now().hour}:",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                "${DateTime.now().minute}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
