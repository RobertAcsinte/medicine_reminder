import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../data/MomentApi.dart';
import 'moment_tile.dart';


class MomentList extends StatefulWidget {
  const MomentList({Key? key}) : super(key: key);

  @override
  State<MomentList> createState() => _MomentListState();
}

class _MomentListState extends State<MomentList> {
  @override
  Widget build(BuildContext context) {

    final list = MomentApi.getMoments();


    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Medicine Reminder"),
      ),
      body: GroupedListView<Moment, String>(
        elements: list,
        groupBy: (element) => element.date.toString(),
        itemComparator: (item1, item2) =>
            item1.title!.compareTo(item2.title!),
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateFormat("EEEE d MMMM").format(DateFormat("yyyy-MM-dd hh:mm:ss").parse(value)),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        itemBuilder: (context, element) {
          return MomentTile(moment: element);
        },
      ),
    );
  }
}