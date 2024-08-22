import 'package:flutter/material.dart';

class SevenTask extends StatefulWidget {
  const SevenTask({super.key});

  @override
  State<SevenTask> createState() => _SevenTaskState();
}

class _SevenTaskState extends State<SevenTask> {

  Set<String> _selectedOptions = {};

  final List<String> _options = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  bool _selectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom CheckboxListTile Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Select All" checkbox
            CheckboxListTile(
              title: Text(
                'Select All',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              value: _selectAll,
              onChanged: (bool? isChecked) {
                setState(() {
                  _selectAll = isChecked ?? false;
                  if (_selectAll) {
                    _selectedOptions.addAll(_options);
                  } else {
                    _selectedOptions.clear();
                  }
                });
              },
              activeColor: Colors.green,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            // "Deselect All" checkbox
            CheckboxListTile(
              title: Text(
                'Deselect All',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              value: !_selectAll,
              onChanged: (bool? isChecked) {
                setState(() {
                  if (isChecked ?? false) {
                    _selectedOptions.clear();
                    _selectAll = false;
                  }
                });
              },
              activeColor: Colors.red,
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            Expanded(
              child: ListView(
                children: _options.map((option) {
                  return CheckboxListTile(
                    title: Text(
                      option,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    value: _selectedOptions.contains(option),
                    onChanged: (bool? isChecked) {
                      setState(() {
                        if (isChecked == true) {
                          _selectedOptions.add(option);
                        } else {
                          _selectedOptions.remove(option);
                        }
                        _selectAll = _selectedOptions.length == _options.length;
                      });
                    },
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    secondary: Icon(
                      _selectedOptions.contains(option)
                          ? Icons.check_circle
                          : Icons.circle,
                      color: _selectedOptions.contains(option)
                          ? Colors.green
                          : Colors.grey,
                    ), // Custom icon next to the checkbox
                    controlAffinity: ListTileControlAffinity.leading, // Position of the checkbox
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            // Display selected options
            Text('Selected Options:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _selectedOptions.isNotEmpty
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _selectedOptions.map((option) {
                return Text(
                  option,
                  style: TextStyle(fontSize: 16),
                );
              }).toList(),
            )
                : Text('No options selected',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
