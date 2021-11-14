import 'package:flutter/material.dart';

class AddressWidget extends StatelessWidget {
  final String atmType;
  final String text;

  const AddressWidget(this.atmType, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child:  Icon(Icons.location_on_rounded, color: Colors.red,)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(atmType,
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