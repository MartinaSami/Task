import 'package:flutter/material.dart';

int? id;

void navigateWithoutFinish(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
