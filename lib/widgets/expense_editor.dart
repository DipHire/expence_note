import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expence_note/styles/appstyle.dart';
import 'package:flutter/material.dart';

class expenseEditorScreen extends StatefulWidget {
  const expenseEditorScreen({Key? key}) : super(key: key);

  @override
  State<expenseEditorScreen> createState() => _expenseEditorScreenState();
}

class _expenseEditorScreenState extends State<expenseEditorScreen> {
  int color_id = Random().nextInt(Appstyle.cardColor.length);
  String date = DateTime.now().toString();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _mainController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: Appstyle.cardColor[color_id],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add a new Expence",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'User Name'),
              style: Appstyle.maintitle,
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              date,
              style: Appstyle.dateTitle,
            ),
            SizedBox(
              height: 28.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Expence Info'),
              style: Appstyle.mainContent,
            ),
            TextField(
              controller: _moneyController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: 'Money'),
              style: Appstyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appstyle.accentColor,
        onPressed: () {
          FirebaseFirestore.instance.collection("udhari").add({
            "user": _titleController.text,
            "creation_date": date,
            "desc": _mainController.text,
            "color_id": color_id,
            "money": _moneyController.text,
          }).then((value) {
            print(value.id);
            Navigator.pop(context);
          }).catchError(
              (error) => print("Failed to add new Note due to $error"));
        },
        child: Icon(
          Icons.thumb_up,
        ),
      ),
    );
  }
}
