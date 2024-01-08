import 'package:flutter/material.dart';
import './pages/pages.dart';
import './services/services.dart';

Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.hive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.light(),
      home:HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}