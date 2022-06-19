import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/color_manager.dart';
import 'package:instructify/presentation/resource/size_manager.dart';

class SingleTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool showPassword;
  const SingleTextField({
    Key? key,
    required this.label,
    required this.controller,
    required this.showPassword,
  }) : super(key: key);

  @override
  State<SingleTextField> createState() => _SingleTextFieldState();
}

class _SingleTextFieldState extends State<SingleTextField> {
  late bool _obscureText = false;
  @override
  void initState() {
    if (widget.showPassword) {
      _obscureText = true;
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

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
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(SizeManager.s8),
              ),
              suffixIcon: widget.showPassword
                  ? IconButton(
                      highlightColor: Colors.transparent,
                      icon: Icon(!_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      splashColor: Colors.transparent,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
