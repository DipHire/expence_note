import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expence_note/styles/appstyle.dart';
import 'package:flutter/material.dart';

class expenseReaderScreen extends StatefulWidget {
  expenseReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;
  @override
  State<expenseReaderScreen> createState() => _expenseReaderScreenState();
}

class _expenseReaderScreenState extends State<expenseReaderScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: Appstyle.cardColor[color_id],
      appBar: AppBar(
        backgroundColor: Appstyle.cardColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["user"],
              style: Appstyle.maintitle,
            ),
            SizedBox(
              height: 3.0,
            ),
            Text(
              widget.doc["creation_date"],
              style: Appstyle.dateTitle,
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.doc["desc"],
                  style: Appstyle.mainContent,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.doc["money"],
                  style: Appstyle.mainContent,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
