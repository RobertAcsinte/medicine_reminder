import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../data/MomentApi.dart';

class MomentTileWidget extends StatefulWidget {
  final Moment moment;

  MomentTileWidget({required this.moment});

  @override
  State<MomentTileWidget> createState() => _MomentTileWidgetState();
}

class _MomentTileWidgetState extends State<MomentTileWidget> {
  //checks if all the medicines are taken to check a moment
  bool checkedMoment() {
    bool isChecked = true;
    for (var element in widget.moment.medicines) {
      if (element.taken == false) {
        isChecked = false;
      }
    }
    return isChecked;
  }

  //when checking a moment, all the medicines are set as taken
  void setChecked(bool value) {
    for (var i = 0; i < widget.moment.medicines.length; i++) {
      widget.moment.medicines[i].taken = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: checkedMoment() ? Colors.teal : Colors.white,
              borderRadius: BorderRadius.only(
                topRight: const Radius.circular(10),
                topLeft: const Radius.circular(10),
                bottomRight: widget.moment.isCollapsed! ? const Radius.circular(0) : const Radius.circular(10),
                bottomLeft: widget.moment.isCollapsed! ? const Radius.circular(0) : const Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ListTile(
                      //surround by CircleAvatar so the leading image can be centered
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image(
                          alignment: Alignment.bottomCenter,
                          image:
                              AssetImage("assets/${widget.moment.icon!}.png"),
                          color: checkedMoment() ? Colors.white : Colors.black,
                        ),
                      ),
                      title: Text(widget.moment.title!),
                      textColor: checkedMoment() ? Colors.white : Colors.black,
                      subtitle:
                          Text(DateFormat("HH:mm").format(widget.moment.date!)),
                      onTap: () {
                        setState(() {
                          widget.moment.isCollapsed =
                              !widget.moment.isCollapsed!;
                        });
                      }),
                ),
                Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  checkColor: Colors.teal,
                  fillColor: checkedMoment()
                      ? MaterialStateProperty.all<Color>(Colors.white)
                      : null,
                  value: checkedMoment(),
                  onChanged: (bool? value) {
                    setState(() {
                      setChecked(value!);
                    });
                  },
                ),
              ],
            ),
          ),

          //show the list of medicine
          if (widget.moment.isCollapsed!)
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: widget.moment.medicines.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    //color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 8),
                            child: ListTile(
                              //surround by CircleAvatar so the leading image can be centered
                              title: Text(widget.moment.medicines[index].name!),
                              textColor: Colors.black,
                            ),
                          ),
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          checkColor: Colors.white,
                          fillColor: widget.moment.medicines[index].taken! ? MaterialStateProperty.all<Color>(Colors.green) : null,
                          value: widget.moment.medicines[index].taken,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.moment.medicines[index].taken = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                })
        ],
      ),
    );
  }
}
