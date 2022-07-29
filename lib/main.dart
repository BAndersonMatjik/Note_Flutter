import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'NoteModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Apps',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: SafeArea(child: NoteScreen()), // Panggil FirstScreen di sini
    );
  }
}

class NoteScreen extends StatelessWidget {
  final List<int> numberList = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<NoteModel> _listNote = <NoteModel>[];

  @override
  Widget build(BuildContext context) {
    _listNote.add(NoteModel(1, "Go to One", "Alelelle", DateTime.now()));

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _listNote.add(NoteModel(_listNote.length + 1,
                "Go to ${_listNote.length + 1}", "Shal", DateTime.now()));
            developer.log("test ${_listNote.length}");

          },
          label: const Text("Add New Note"),
          icon: Icon(Icons.add),
          backgroundColor: Colors.pink,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            children: [
              Text(
                "Todo Apps",
                style: Theme.of(context).textTheme.headline3,
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Click Item ${_listNote[index].title}")));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Text(
                            _listNote[index].title,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            _listNote[index].note,
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _listNote.length,
              ))
            ],
          ),
        ));
  }

}
