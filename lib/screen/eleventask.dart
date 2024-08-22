import 'package:flutter/material.dart';

class ElevenTask extends StatefulWidget {
  const ElevenTask({super.key});

  @override
  State<ElevenTask> createState() => _ElevenTaskState();
}

class _ElevenTaskState extends State<ElevenTask> {

  final _formKey = GlobalKey<FormState>();

  // Radio button group value
  String? _selectedRadioOption;

  // Checkbox values
  bool _isCheckbox1Checked = false;
  bool _isCheckbox2Checked = false;

  // Switch state
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Form Validation'),
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
                'Select an option:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RadioListTile<String>(
                title: Text('Option 1'),
                value: 'option1',
                groupValue: _selectedRadioOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedRadioOption = value;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text('Option 2'),
                value: 'option2',
                groupValue: _selectedRadioOption,
                onChanged: (String? value) {
                  setState(() {
                    _selectedRadioOption = value;
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
                title: Text('Checkbox 1'),
                value: _isCheckbox1Checked,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckbox1Checked = value ?? false;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Checkbox 2'),
                value: _isCheckbox2Checked,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckbox2Checked = value ?? false;
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
                    // Process the data and show a summary
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Preferences Summary'),
                        content: Text(
                          'Selected Radio Option: $_selectedRadioOption\n'
                              'Checkbox 1 Checked: $_isCheckbox1Checked\n'
                              'Checkbox 2 Checked: $_isCheckbox2Checked\n'
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
