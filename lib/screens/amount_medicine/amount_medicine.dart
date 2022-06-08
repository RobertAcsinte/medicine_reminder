import 'package:flutter/material.dart';
import 'package:medicine_reminder/widgets/card_stats.dart';
import '../../data/MomentApi.dart';


class AmountMedicineWidget extends StatefulWidget {
  const AmountMedicineWidget({Key? key}) : super(key: key);

  @override
  State<AmountMedicineWidget> createState() => _AmountMedicineWidgetState();
}

class _AmountMedicineWidgetState extends State<AmountMedicineWidget> {

  final list = MomentApi.getMoments();

  DateTime dateOfWeek = DateTime.parse('2019-01-07');

  // Find _the first date of the week which contains the provided date.
  DateTime _findFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  // Find last date of the week which contains provided date.
  DateTime _findLastDateOfTheWeek(DateTime dateTime) {
    return dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday +1));
  }
  
  //check if it's part of week
  bool _checkWeek(DateTime dateTime){
    if(dateTime.compareTo(_findFirstDateOfTheWeek(dateOfWeek)) >= 0 &&
        dateTime.compareTo(_findLastDateOfTheWeek(dateOfWeek)) < 0) {
      return true;
    } else {
      return false;
    }
  }

  //total to be taken
  int _totalWeek(){
    int total = 0;
    list.forEach((element) {
      if(_checkWeek(element.date!)){
        total += element.medicines.length;
      }
    });
    return total;
  }

  //total taken
  int _totalTaken(){
    int total = 0;
    list.forEach((element) {
      if(_checkWeek(element.date!)){
        element.medicines.forEach((medicine) {
          if(medicine.taken!){
            total++;
          }
        });
      }
    });
    return total;
  }

  //amount medicine
  int _totalMedicine(String medicineName){
    int total = 0;
    list.forEach((element) {
      if(_checkWeek(element.date!)){
        element.medicines.forEach((medicine) {
          if(medicine.taken! && medicine.name == medicineName){
            total++;
          }
        });
      }
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardWidget(statsName: 'Total medicine', amount: _totalWeek().toString()),
            CardWidget(statsName: 'Amount taken of everything', amount: _totalTaken().toString()),
            CardWidget(statsName: 'Amount Paracetamol taken', amount: _totalMedicine("Paracetamol").toString()),
            CardWidget(statsName: 'Amount Vitamine C taken', amount: _totalMedicine("Vitamine C").toString()),
            CardWidget(statsName: 'Amount Acebutol taken', amount: _totalMedicine("Acebutol").toString()),
            CardWidget(statsName: 'Amount Melatonin taken', amount: _totalMedicine("Melatonin").toString()),
          ],
        )
      ),
    );
  }
}
