import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class SingleTextField extends StatefulWidget {
  final String label;
  TextEditingController controller;
  SingleTextField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  State<SingleTextField> createState() => _SingleTextFieldState();
}

class _SingleTextFieldState extends State<SingleTextField> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(
            height: SizeManager.s16,
          ),
          TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeManager.s8),
              ),
              focusColor: Colors.green,
            ),
            onChanged: (value) {
              setState(() {
                widget.controller.text = value;
              });
            },
            keyboardType: TextInputType.text,
          )
        ],
      ),
    );
  }
}
