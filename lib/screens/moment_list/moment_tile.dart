import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/MomentApi.dart';


class MomentTile extends StatelessWidget {

  final Moment moment;

  MomentTile({ required this.moment });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Image(
            image: AssetImage("assets/${moment.icon!}.png"),
          ),
          title: Text(moment.title!),
          subtitle: Text(DateFormat("HH:mm").format(moment.date!)),
        ),
      ),
    );
  }
}