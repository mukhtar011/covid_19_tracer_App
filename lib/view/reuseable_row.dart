import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({Key? key ,
    required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5, right: 10, left: 10, top: 10,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Title"),
              Text("Value"),
            ],
          ),
          SizedBox(height: 5,),
          Divider(),
        ],
      ),
    );
  }
}
