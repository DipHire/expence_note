import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expence_note/styles/appstyle.dart';
import 'package:flutter/material.dart';

Widget expenseCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Appstyle.cardColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["user"].toString(),
            style: Appstyle.maintitle,
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            doc["creation_date"],
            style: Appstyle.dateTitle,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Text(
                doc["desc"],
                style: Appstyle.mainContent,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                doc["money"].toString(),
                style: Appstyle.mainContent,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.check,
              size: 24.0,
              color: Colors.green,
            ),
            label: Text('Paid',style: TextStyle(color: Colors.green),), 
          ),
        ],
      ),
    ),
  );
}
