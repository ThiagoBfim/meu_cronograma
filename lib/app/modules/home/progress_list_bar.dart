import 'package:flutter/material.dart';

class ProgressListBar extends StatelessWidget {
  final double percentConcluido;

  const ProgressListBar({Key key, this.percentConcluido}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                value: percentConcluido,
                backgroundColor: Colors.grey.withAlpha(50),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            (percentConcluido * 100).round().toString() + "%",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
