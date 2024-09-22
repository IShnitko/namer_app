import 'package:flutter/material.dart';
import 'package:namer_app/app/app.dart';
import 'package:namer_app/state/app_state.dart';

void main() {
  runApp(
    const AppStateWidget(
      child: MyApp(),
    ),
  );
}