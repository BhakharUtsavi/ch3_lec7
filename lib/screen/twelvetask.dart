import 'package:flutter/material.dart';

class TwelveTask extends StatefulWidget {
  const TwelveTask({super.key});

  @override
  State<TwelveTask> createState() => _TwelveTaskState();
}

class _TwelveTaskState extends State<TwelveTask> {

  int _currentStep = 0;

  bool _isRadioSelected = false;
  bool _isCheckboxChecked = false;
  bool _isSwitchOn = false;

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi-Step Form'),
      ),
      body: IndexedStack(
        index: _currentStep,
        children: [
          // Step 1: Radio Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Select an option:'),
                RadioListTile<bool>(
                  title: Text('Option 1'),
                  value: true,
                  groupValue: _isRadioSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      _isRadioSelected = value!;
                    });
                  },
                ),
                RadioListTile<bool>(
                  title: Text('Option 2'),
                  value: false,
                  groupValue: _isRadioSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      _isRadioSelected = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          // Step 2: Checkbox
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                CheckboxListTile(
                  title: Text('Check this box'),
                  value: _isCheckboxChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isCheckboxChecked = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          // Step 3: Switch
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Toggle the switch:'),
                SwitchListTile(
                  title: Text('Switch'),
                  value: _isSwitchOn,
                  onChanged: (bool value) {
                    setState(() {
                      _isSwitchOn = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (_currentStep > 0)
              TextButton(
                onPressed: _previousStep,
                child: Text('Previous'),
              ),
            TextButton(
              onPressed: _nextStep,
              child: Text(_currentStep < 2 ? 'Next' : 'Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
