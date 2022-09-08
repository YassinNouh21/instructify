import 'package:flutter/material.dart';

import '../../../resource/enums.dart';

// FIXME change the unselected color to the theme color text and radio
class AppRadioButtons extends StatefulWidget {
  const AppRadioButtons({Key? key}) : super(key: key);

  @override
  State<AppRadioButtons> createState() => AppRadioStateButtons();
}

class AppRadioStateButtons extends State<AppRadioButtons> {
  SignPositionOptions? _selectedPosition = SignPositionOptions.student;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RadioListTile<SignPositionOptions>(
          title: const Text('Student'),
          value: SignPositionOptions.student,
          groupValue: _selectedPosition,
          onChanged: (SignPositionOptions? value) {
            setState(() {
              _selectedPosition = value;
            });
          },
        ),
        Theme(
          data: ThemeData(
            disabledColor: Colors.grey,
          ),
          child: RadioListTile<SignPositionOptions>(
            title: const Text('Teacher'),
            value: SignPositionOptions.teacher,
            groupValue: _selectedPosition,
            toggleable: false,
            onChanged: null,
          ),
        ),
      ],
    );
  }
}
