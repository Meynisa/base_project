import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../core.dart';

class PrimaryTextfield extends StatefulWidget {
  PrimaryTextfield(
      {Key? key,
      this.label,
      this.textHint,
      this.isRequiredSymbol = false,
      this.keyboardType,
      this.verticalPadding,
      this.initialValue,
      this.onTextChange,
      this.enableTouch = true,
      this.autoFocus = false,
      this.textError,
      this.onSaved,
      this.validator,
      this.textEditingController,
      this.maxLine = 1,
      this.subLabel,
      this.enable = true,
      this.textInputFormatter,
      this.maxLength,
      this.fontWeight = FontWeight.normal,
      this.textFieldHeight,
      this.suffixIcon,
      this.prefixIcon,
      this.readOnly = false,
      this.onTap,
      this.textCapitalization = TextCapitalization.sentences,
      this.prefix,
      this.textFieldType = TextFieldType.FREE_TEXT,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.focusNode,
      this.scrollPadding = 40,
      this.isVisible = false,
      this.autofillType,
      this.onEditingCompleted, this.labelText})
      : super(key: key);

  final String? label;
  final Function? onTap;
  final String? subLabel;
  final String? textHint;
  final TextInputType? keyboardType;
  final Function(String value)? onTextChange;
  final Function? onSaved;
  final String? textError;
  final double? verticalPadding;
  final bool isRequiredSymbol;
  final Widget? suffixIcon;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? textEditingController;
  final FontWeight fontWeight;
  final int maxLine;
  final bool enable;
  final String? initialValue;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final bool enableTouch;
  final String? prefix;
  final TextFieldType textFieldType;
  final Icon? prefixIcon;
  final AutovalidateMode autovalidateMode;
  final bool autoFocus;
  final FocusNode? focusNode;
  final double? textFieldHeight;
  final double scrollPadding;
  final bool isVisible;
  final Iterable<String>? autofillType;
  final Function()? onEditingCompleted;
  final String? labelText;
  @override
  _PrimaryTextfieldState createState() => _PrimaryTextfieldState();
}

class _PrimaryTextfieldState extends State<PrimaryTextfield> {
  bool _isObscured = true;
  String val = '';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
            scrollPadding: EdgeInsets.only(bottom: widget.scrollPadding),
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            textCapitalization: widget.textCapitalization,
            maxLines: widget.maxLine,
            autofocus: widget.autoFocus,
            autocorrect: false,
            enabled: widget.enableTouch,
            onTap: widget.onTap as void Function()?,
            obscureText: widget.textFieldType == TextFieldType.PASSWORD
                ? _isObscured
                : false,
            controller: widget.textEditingController,
            initialValue: widget.initialValue,
            inputFormatters: setupTextInputFormatter(),
            maxLength: widget.maxLength,
            validator: widget.validator,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            autovalidateMode: widget.autovalidateMode,
            style: subtitle2().copyWith(
                color: Get.isDarkMode
                    ? ColorsCollection.cRipple10
                    : ColorsCollection.cDarkGrey),
            autofillHints: widget.autofillType,
            decoration: InputDecoration(
                suffixIcon: widget.isVisible ? validation() : widget.suffixIcon,
                fillColor: !widget.enableTouch ? Colors.grey : Colors.white,
                errorStyle: subtitle2().copyWith(color: Colors.red),
                labelText: widget.labelText,
                filled: widget.enable,
                isDense: true,
                contentPadding: widget.prefixIcon != null
                    ? EdgeInsets.only(
                        right: 10,
                        top: widget.verticalPadding ?? 15,
                        bottom: widget.verticalPadding ?? 15,
                        left: 38)
                    : EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                hintText: widget.textHint,
                prefixIcon: widget.prefix != null
                    ? Container(
                        padding: EdgeInsets.only(left: 8, right: 2),
                        alignment: Alignment.centerLeft,
                        child: Text('${widget.prefix}',
                            style: subtitle1()
                                .copyWith(color: ColorsCollection.cRipple10)))
                    : widget.prefixIcon != null
                        ? Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: widget.prefixIcon)
                        : null,
                prefixIconConstraints:
                    BoxConstraints(minWidth: 0, minHeight: 0, maxWidth: 40),
                prefixStyle: TextStyle(color: Colors.blue),
                counterStyle:
                    subtitle2().copyWith(color: ColorsCollection.cDarkGrey),
                hintStyle:
                    subtitle2().copyWith(color: ColorsCollection.cDarkGrey),
                labelStyle:
                    subtitle2().copyWith(color: ColorsCollection.cDarkGrey),
                errorText: widget.textError,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: ColorsCollection.cRipple10)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: ColorsCollection.cUnselectedLoad)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorsCollection.cRipple10),
                    borderRadius: BorderRadius.circular(15)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(15)),
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(15))),
            onEditingComplete: widget.onEditingCompleted,
            onChanged: (text) {
              if (widget.onTextChange != null) {
                widget.onTextChange!(text);
                setState(() => val = text);
              }
            },
            keyboardType: widget.keyboardType));
  }

  Widget validation() {
    return IconButton(
        onPressed: () {
          _isObscured = !_isObscured;
          setState(() {});
        },
        icon: Icon(_isObscured ? Icons.visibility : Icons.visibility_off,
            color: ColorsCollection.cGreyCDColor));
  }

  List<TextInputFormatter> setupTextInputFormatter() {
    var inputFormatter = widget.textInputFormatter;
    if (inputFormatter != null && inputFormatter.isNotEmpty) {
      inputFormatter.add(LengthLimitingTextInputFormatter(widget.maxLength));
    } else {
      return [LengthLimitingTextInputFormatter(widget.maxLength)];
    }
    return inputFormatter;
  }
}
