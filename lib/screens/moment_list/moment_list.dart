import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../data/MomentApi.dart';
import '../../widgets/moment_tile.dart';

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
      body: GroupedListView<Moment, String>(
        elements: list,
        //convert the date into dd MMMM string so it can be grouped into the ascending order by date
        groupBy: (element) => DateFormat("dd MMMM yyyy").format(element.date!),
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: false,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Text(
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            //convert the date again to show the day of the week in the groups
            DateFormat("EEEE d MMMM").format(DateFormat("d MMMM yyyy").parse(value)),
          ),
        ),
        itemBuilder: (context, element) {
          return MomentTileWidget(moment: element);
        },
      ),
    );
  }
}