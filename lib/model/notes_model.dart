import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 1)
class NotesModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String category;

  NotesModel(
      {required this.title,
        required this.description,
        required this.category,});
}