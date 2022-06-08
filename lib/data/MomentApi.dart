import 'dart:math';

import 'package:intl/intl.dart';


abstract class IconMoment {
  static String alarm = "baseline_alarm_black_24pt";
  static String business = "baseline_business_center_black_24pt";
  static String bookmark = "baseline_class_black_24pt";
  static String breakfast = "baseline_free_breakfast_black_24pt";
  static String home =  "baseline_home_black_24pt";
  static String pharmacy = "baseline_local_pharmacy_black_24pt";
}

abstract class CheckboxState {

  static String empty = "checkbox_empty";
  static String checkedWhite = "checkbox_checked_white";
  static String checkedGreen = "checkbox_checked_green";
}

class Moment {

  final String? title;
  final String? icon;
  final List<Medicine> medicines;
  final DateTime? date;
  bool? isCollapsed;

  Moment({required this.title, required this.date, required this.icon, required this.medicines, this.isCollapsed = true});
}

class Medicine {

  final String? name;
  bool? taken;

  Medicine({required this.name, this.taken = false});
}

class MomentApi {

  static DateTime _formatter(String date){
    DateTime now = DateFormat("yyyy-MM-dd HH:mm").parse(date);
    return now;
  }

  static Moment _breakfast(String day){
    return Moment(title: "Ontbijt", date: _formatter("2019-01-$day 8:00"), icon: IconMoment.breakfast,
        medicines: [Medicine(name: 'Paracetamol', taken: Random().nextBool()),
          Medicine(name: 'Vitamine C', taken: Random().nextBool())]);
  }

  static Moment _lunch(String day){
    return Moment(title: "Lunch", date: _formatter("2019-01-$day 12:00"), icon: IconMoment.home,
        medicines: [Medicine(name: 'Acebutol', taken: Random().nextBool())]);
  }

  static Moment _atWork(String day){
    return Moment(title: "Op 't werk", date: _formatter("2019-01-$day 15:00"), icon: IconMoment.business,
        medicines: [Medicine(name: 'Paracetamol', taken: Random().nextBool())]);
  }

  static Moment _bedTime(String day){
    return Moment(title: "Voor het slapen", date: _formatter("2019-01-$day 22:00"), icon: IconMoment.alarm,
        medicines: [Medicine(name: 'Melatonin', taken: Random().nextBool())]);
  }

  static List<Moment> moments = [];

  static List<Moment> getMoments() {
    if(moments.isEmpty){
      moments = [
        _breakfast("01"),
        _lunch("01"),

        _breakfast("02"),
        _lunch("02"),
        _atWork("02"),

        _breakfast("03"),
        _lunch("03"),

        _breakfast("04"),
        _atWork("04"),

        _breakfast("06"),
        _lunch("06"),
        _atWork("06"),

        _bedTime("07"),

        _breakfast("08"),
        _lunch("08"),

        _breakfast("09"),
        _lunch("09"),
        _atWork("09"),

        _breakfast("10"),
        _lunch("10"),

        _breakfast("11"),
        _atWork("11"),

        _breakfast("13"),
        _lunch("13"),
        _atWork("13"),

        _bedTime("14"),
      ];
      moments[Random().nextInt(moments.length)].isCollapsed = false;
    }
    return moments;
  }

}