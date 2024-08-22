import 'package:flutter/material.dart';

class SixTask extends StatefulWidget {
  const SixTask({super.key});

  @override
  State<SixTask> createState() => _SixTaskState();
}

class _SixTaskState extends State<SixTask> {

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
        title: Text('Select/Deselect All Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxListTile(
              title: Text('Select All'),
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
            ),
            CheckboxListTile(
              title: Text('Deselect All'),
              value: !_selectAll,
              onChanged: (bool? isChecked) {
                setState(() {
                  if (isChecked ?? false) {
                    _selectedOptions.clear();
                    _selectAll = false;
                  }
                });
              },
            ),
            Expanded(
              child: ListView(
                children: _options.map((option) {
                  return CheckboxListTile(
                    title: Text(option),
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
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            // Display selected options
            Text(
              'Selected Options:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                : Text(
              'No options selected',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
