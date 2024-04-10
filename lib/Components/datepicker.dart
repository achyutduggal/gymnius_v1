import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      onDatePicked(picked); // Call the custom function after picking a date
    }
  }

  void onDatePicked(DateTime pickedDate) {
    print("Selected Date: ${pickedDate.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.calendar_month_rounded,color: Color(0xff39FF14),),
        onPressed: () => _selectDate(context),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
          elevation: MaterialStateProperty.all(5),
        ),
        label: Text(
          '${DateFormat('yyyy-MM-dd').format(selectedDate)}',
          style: TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}
