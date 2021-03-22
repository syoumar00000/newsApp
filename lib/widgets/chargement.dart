import 'package:flutter/material.dart';
import 'texte_sy.dart';
import 'package:webfeed/webfeed.dart';

class Chargement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new TexteSy(
        "chargement en cours...",
        fontStyle: FontStyle.italic,
        fontSize: 30.0,
      ),
    );
  }
}