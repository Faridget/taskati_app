import 'package:flutter/material.dart';

void navigatTo(context, Widget newWiew) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newWiew,
  ));
}

void navigatReplace(context, Widget newWiew) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => newWiew,
  ));
}
