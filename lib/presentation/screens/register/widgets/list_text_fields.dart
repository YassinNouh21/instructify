import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/single_text_field.dart';

class ListTextFields extends StatefulWidget {
  static String firstName = '';
  static String lastName = '';
  static final formKey = GlobalKey<FormState>();
  const ListTextFields({Key? key}) : super(key: key);

  @override
  State<ListTextFields> createState() => ListTextFieldsState();
}

class ListTextFieldsState extends State<ListTextFields> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: ListTextFields.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleTextField(
            controller: _firstNameController,
            label: 'First Name',
            validator: ValidationBuilder().required().build(),
            onChanged: (value) {
              _firstNameController.text = value;
              _firstNameController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _firstNameController.text.length));
              ListTextFields.firstName = _firstNameController.text;
            },
            showPassword: false,
          ),
          const SizedBox(
            height: SizeManager.s28,
          ),
          SingleTextField(
            onChanged: (value) {
              _lastNameController.text = value;
              _lastNameController.selection = TextSelection.fromPosition(
                  TextPosition(offset: _lastNameController.text.length));
              ListTextFields.lastName = _lastNameController.text;
            },
            validator: ValidationBuilder().required().build(),
            controller: _lastNameController,
            label: 'Last Name',
            showPassword: false,
          )
        ],
      ),
    );
  }
}
