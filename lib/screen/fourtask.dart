import 'package:flutter/material.dart';

class FourTask extends StatefulWidget {
  const FourTask({super.key});

  @override
  State<FourTask> createState() => _FourTaskState();
}

class _FourTaskState extends State<FourTask> {

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the current state of the checkbox
            Text(
              _isChecked ? 'Checkbox is Checked' : 'Checkbox is Unchecked',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Checkbox widget
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
