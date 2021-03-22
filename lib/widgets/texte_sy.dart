import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart';

class TexteSy extends Text {
  TexteSy(String data, { textAlign: TextAlign.center, color: Colors.indigo, fontSize: 15.0, fontStyle: FontStyle.normal}):
        super(
          data ?? "",
          textAlign: textAlign,
          style: new TextStyle(
              color: color,
              fontSize: fontSize,
              fontStyle: fontStyle
          )
      );
}