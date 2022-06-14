import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class SingleTextField extends StatefulWidget {
  final String label;
  TextEditingController controller;
  final bool? showPassword;
  SingleTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.showPassword,
  }) : super(key: key);

  @override
  State<SingleTextField> createState() => _SingleTextFieldState();
}

class _SingleTextFieldState extends State<SingleTextField> {
  bool _showSwitchIcon = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width -
        (MediaQuery.of(context).size.width * 0.15);
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const SizedBox(
            height: SizeManager.s16,
          ),
          TextField(
            controller: widget.controller,
            obscureText: _showSwitchIcon ? false : true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeManager.s8),
              ),
              suffixIcon: widget.showPassword == true
                  ? IconButton(
                      icon: Icon(
                        _showSwitchIcon
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: ColorManager.secondaryColor,
                        size: SizeManager.s20,
                      ),
                      onPressed: () {
                        setState(() {
                          _showSwitchIcon = !_showSwitchIcon;
                        });
                      },
                    )
                  : null,
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
