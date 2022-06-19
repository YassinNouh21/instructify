import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';
import 'package:instructify/presentation/shared/single_text_field.dart';

class ListTextFields extends StatefulWidget {
  const ListTextFields({Key? key}) : super(key: key);

  @override
  State<ListTextFields> createState() => ListTextFieldsState();
}

class ListTextFieldsState extends State<ListTextFields> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleTextField(
            controller: _firstNameController,
            label: 'First Name',
            showPassword: false,

          ),
          const SizedBox(
            height: SizeManager.s28,
          ),
          SingleTextField(
            controller: _lastNameController,
            label: 'Last Name',
            showPassword: false,

          )
        ],
      ),
    );
  }
}
