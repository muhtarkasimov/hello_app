import 'package:flutter/material.dart';

class NewsWidget extends StatelessWidget {
  final String date;
  final String text;

  const NewsWidget(this.text, this.date);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Icon(Icons.adjust, color: Colors.red,)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date,
                    style: TextStyle(fontStyle: FontStyle.italic)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                      text,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}