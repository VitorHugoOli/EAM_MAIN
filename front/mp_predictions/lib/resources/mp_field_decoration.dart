import 'package:flutter/material.dart';

class MPDecorationField extends InputDecoration {
  static const OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.transparent, width: 0),
  );

  const MPDecorationField({String? labelText,
    String? hintText,
  }
      )
      : super(
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          border: _border,
          fillColor: const Color(0xffd7d7d7),
          filled: true,
          disabledBorder: _border,
          enabledBorder: _border,
          focusedBorder: _border,
          errorBorder: _border,
          focusedErrorBorder: _border,
          isCollapsed: false,
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        );
}
