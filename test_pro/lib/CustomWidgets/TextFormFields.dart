import 'package:flutter/material.dart';

class TextFormFields extends StatefulWidget {
  final String topText;

  final TextInputType keybordType;
  final bool? suffixicon;
  final TextEditingController controller;
  const TextFormFields({
    required this.controller,
    required this.topText,
    required this.keybordType,
    this.suffixicon = null,
    Key? key,
  }) : super(key: key);

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.topText,
                style: TextStyle(fontSize: 16),
              )),
          SizedBox(
            height: 3,
          ),
          TextFormField(
            controller: widget.controller,
            obscureText: widget.suffixicon == null ? false : !_passwordVisible,
            decoration: new InputDecoration(
              suffixIcon: widget.suffixicon == null
                  ? null
                  : IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
              fillColor: Colors.white,
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(13.0),
                borderSide: BorderSide(
                  color: Colors.yellow,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.0),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
            ),
            keyboardType: widget.keybordType,
            style: new TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
