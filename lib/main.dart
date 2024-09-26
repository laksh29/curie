import 'package:curie/data/json_data.dart';
import 'package:curie/models/form_model.dart';
import 'package:curie/screens/form_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FormPageModel formPageModel = FormPageModel.fromJson(jsonData);
    return MaterialApp(
      home: DynamicForm(
        data: formPageModel,
      ),
    );
  }
}
