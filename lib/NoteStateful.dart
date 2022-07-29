import 'package:flutter/material.dart';

import 'NoteModel.dart';

class NoteStateful extends StatefulWidget{
  final List<NoteModel> _list = <NoteModel>[];

  @override
  State<StatefulWidget> createState() {
    return _NoteStateful();
  }
}

class _NoteStateful extends State<NoteStateful>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}