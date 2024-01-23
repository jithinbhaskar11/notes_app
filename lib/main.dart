import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/view/1_splash_page/splash_page.dart';

Future <void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  var box = await Hive.openBox<NotesModel>('noteBox');




  runApp(Notes_App());
}

class Notes_App extends StatelessWidget {
  const Notes_App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splash_Page(),
    );
  }
}
