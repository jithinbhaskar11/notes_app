import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../model/notes_model.dart';

class SpecificCardScreen extends StatelessWidget {
  final NotesModel specificCard;

  const SpecificCardScreen({Key? key, required this.specificCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'SK',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'INK',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
      ),
      body: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(color: Colors.blue[50]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${specificCard.title}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                '${specificCard.description}',
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: 8),
              Text(
                '${specificCard.category}',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
