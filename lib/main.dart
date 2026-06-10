import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date and Time Picker',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date & Time Picker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedDate == null
                  ? 'No date selected'
                  : 'Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickDate,
              child: const Text('Select Date'),
            ),

            const SizedBox(height: 40),

            Text(
              selectedTime == null
                  ? 'No time selected'
                  : 'Selected Time: ${selectedTime!.format(context)}',
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: pickTime,
              child: const Text('Select Time'),
            ),
          ],
        ),
      ),
    );
  }
}