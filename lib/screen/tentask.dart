import 'package:flutter/material.dart';

class TenTask extends StatefulWidget {
  const TenTask({super.key});

  @override
  State<TenTask> createState() => _TenTaskState();
}

class _TenTaskState extends State<TenTask> {

  String? _selectedOption;

  bool _isOption1Checked = false;
  bool _isOption2Checked = false;

  bool _isSwitchOn = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Radio buttons
              Text(
                'Select your favorite option:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RadioListTile<String>(
                title: Text('Option 1'),
                value: 'option1',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Option 2'),
                value: 'option2',
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedOption = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Checkboxes
              Text(
                'Select additional options:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              CheckboxListTile(
                title: Text('Additional Option 1'),
                value: _isOption1Checked,
                onChanged: (bool? value) {
                  setState(() {
                    _isOption1Checked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Additional Option 2'),
                value: _isOption2Checked,
                onChanged: (bool? value) {
                  setState(() {
                    _isOption2Checked = value ?? false;
                  });
                },
              ),
              SizedBox(height: 20),

              // Switch
              SwitchListTile(
                title: Text('Enable Feature'),
                value: _isSwitchOn,
                onChanged: (bool value) {
                  setState(() {
                    _isSwitchOn = value;
                  });
                },
                activeColor: Colors.blue,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.white,
              ),
              SizedBox(height: 20),

              // Submit button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process the data and show the summary
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Preferences Summary'),
                        content: Text(
                          'Selected Option: $_selectedOption\n'
                              'Additional Option 1: $_isOption1Checked\n'
                              'Additional Option 2: $_isOption2Checked\n'
                              'Feature Enabled: $_isSwitchOn',
                        ),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
