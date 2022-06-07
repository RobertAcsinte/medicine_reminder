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
      backgroundColor: const Color(0xFFEFEFEF),
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Medicine Reminder"),
      ),
      body: GroupedListView<Moment, String>(
        elements: list,
        //convert the date into dd MMMM string so it can be grouped into the ascending order by date
        groupBy: (element) => DateFormat("dd MMMM").format(element.date!),
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: false,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 10),
          child: Text(
            //convert the date again to show the day of the week in the groups
            DateFormat("EEEE d MMMM").format(DateFormat("d MMMM").parse(value)),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        itemBuilder: (context, element) {
          return MomentTileWidget(moment: element);
        },
      ),
    );
  }
}