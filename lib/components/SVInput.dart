import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SVInput extends StatelessWidget {

  final String hintText;
  final TextInputType inputType;
  final Function validator;
  final Function onChange;
  final IconData prefixIcon;
  final bool secureText;
  final bool returnOnlyInput;
  final int maxLines;
  final int minLines;
  SVInputEditingController controller;

  SVInput({
    this.hintText,
    this.validator,
    this.inputType = TextInputType.text,
    this.controller,
    this.prefixIcon,
    this.returnOnlyInput = false,
    this.secureText = false,
    this.maxLines = 1,
    this.minLines,
    this.onChange
  });

  @override
  Widget build(BuildContext context) {
    Widget input = TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      obscureText: secureText,
      maxLines: maxLines,
      minLines: minLines,
      onChanged: onChange,
      style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.normal, fontSize: 14.0),
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Container(
          padding: EdgeInsets.only(left: 20.0),
          width: 60.0,
          child: Align(
              alignment: Alignment.centerLeft,
              child: FaIcon(prefixIcon, color: Theme.of(context).accentColor)
          ),
        ) : null,
        contentPadding: EdgeInsets.all(16.0),
        enabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(
              color: controller.valid
                  ? Theme.of(context).accentColor
                  : Colors.redAccent,
              width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: new BorderSide(
              color: controller.valid
                  ? Theme.of(context).accentColor
                  : Colors.redAccent,
              width: 1),
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey),
        fillColor: controller.valid ? Colors.white : Colors.redAccent,
        filled: true,
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(35.0),
          ),
          borderSide: BorderSide(
              color: controller.valid
                  ? Theme.of(context).accentColor
                  : Colors.redAccent,
              width: 3
          ),
        ),
      ),
    );
    if(returnOnlyInput) {
      return input;
    }

    return Column(
      children: [
        input,
        if(controller.invalidMessage != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FaIcon(
                FontAwesomeIcons.times,
                color: Colors.redAccent,
              ),
              SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  controller.invalidMessage,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              )
            ],
          )
      ],
    );
  }
}

class SVInputEditingController extends TextEditingController {
  bool valid;
  Function validation;

  String invalidMessage;

  SVInputEditingController({
    String text,
    this.valid = true,
    this.validation = null,
  }) : super(text: text);

  validate() {
    valid = validation(super.text, createInvalidMessage);
    if(valid) {
      invalidMessage = null;
    }
    return valid;
  }

  bool createInvalidMessage(String message) {
    invalidMessage = message;
    return false;
  }

  void resetValidation() {
    invalidMessage = null;
    valid = true;
  }

  void unsubscribe() {
    resetValidation();
    super.text = '';
  }
}