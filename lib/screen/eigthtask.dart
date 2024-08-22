import 'package:flutter/material.dart';

class EigthTask extends StatefulWidget {
  const EigthTask({super.key});

  @override
  State<EigthTask> createState() => _EigthTaskState();
}

class _EigthTaskState extends State<EigthTask> {

  bool _isSwitched = false;

  final Color _onColor = Colors.lightGreenAccent;
  final Color _offColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Example'),
      ),
      body: Container(
        color: _isSwitched ? _onColor : _offColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Switch(
                value: _isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    _isSwitched = value;
                  });
                },
                activeColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                inactiveThumbColor: Colors.white,
              ),
              SizedBox(height: 20),

              Text(
                _isSwitched ? 'The switch is ON' : 'The switch is OFF',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
