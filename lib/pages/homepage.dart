import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expence_note/styles/appstyle.dart';
import 'package:expence_note/widgets/expense_card.dart';
import 'package:expence_note/widgets/expense_editor.dart';
import 'package:expence_note/widgets/expense_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appstyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Udhari",
          style: GoogleFonts.rockSalt(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Appstyle.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Expence",
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Builder(builder: (context) {
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("udhari")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    //Checking the connection state, if we can still load the data also we can display a progress
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasData) {
                      return GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        children: snapshot.data!.docs
                            .map((expense) => expenseCard(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              expenseReaderScreen(expense)));
                                }, expense))
                            .toList(),
                      );
                    }
                    return Text("Bro no Expense here",
                        style: GoogleFonts.nunito(color: Colors.white));
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => expenseEditorScreen()));
        },
        label: Text("Add User"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
