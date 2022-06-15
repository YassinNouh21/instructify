import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class SingleTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool? showPassword;
  const SingleTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.showPassword,
  }) : super(key: key);

  @override
  State<SingleTextField> createState() => _SingleTextFieldState();
}

class _SingleTextFieldState extends State<SingleTextField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool? _showSwitchIcon = widget.showPassword ?? false;
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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: widget.controller,
            obscureText: _showSwitchIcon,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeManager.s8),
              ),
              suffixIcon: widget.showPassword == true
                  ? IconButton(
                      icon: Icon(
                        _showSwitchIcon
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: ColorManager.secondaryColor,
                        size: SizeManager.s20,
                      ),
                      onPressed: () {
                        setState(() {
                          if (!_showSwitchIcon!) {
                            _showSwitchIcon = false;
                          } else {
                            _showSwitchIcon = true;
                          }
                        });
                      },
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
