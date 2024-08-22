import 'package:flutter/material.dart';

class ThirdTask extends StatefulWidget {
  const ThirdTask({super.key});

  @override
  State<ThirdTask> createState() => _ThirdTaskState();
}

class _ThirdTaskState extends State<ThirdTask> {

  String _selectedOption = 'Option 1';

  final List<Map<String, dynamic>> _options = [
    {'label': 'Option 1', 'icon': Icons.home},
    {'label': 'Option 2', 'icon': Icons.star},
    {'label': 'Option 3', 'icon': Icons.favorite},
    {'label': 'Option 4', 'icon': Icons.settings},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioListTile Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Option: $_selectedOption',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Column(
              children: _options.map((option) {
                return RadioListTile<String>(
                  title: Text(option['label']),
                  secondary: Icon(option['icon']),
                  value: option['label'],
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
