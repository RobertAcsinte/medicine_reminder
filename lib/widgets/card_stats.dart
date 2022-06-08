import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {

  final String statsName;
  final String amount;

  CardWidget({required this.statsName, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            margin: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                    statsName
                ),
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Card(
            color: Colors.teal,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  amount,
                  textAlign: TextAlign.center,
                )
            ),
          ),
        ),
      ],
    );
  }
}

