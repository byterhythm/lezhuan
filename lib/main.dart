import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lezhuan/store.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/welcome_screen.dart';

void main() {
  Store.instance = new Store(storageProvider:  FlutterStorageProvider());
  runApp(MyApp());
}

class FlutterStorageProvider implements StorageProvider {
  @override
  Future<String> load(String pathOrKey) async {
    var dir = await getApplicationDocumentsDirectory();
    var file = new File.fromUri(dir.uri.resolve(pathOrKey));

    return file.readAsString();
  }

  @override
  Future<bool> store(String pathOrKey, String contents) async {
    var dir = await getApplicationDocumentsDirectory();
    var file = new File.fromUri(dir.uri.resolve(pathOrKey));

    await file.writeAsString(contents);

    return true;
  }

  @override
  Future<bool> delete(String pathOrKey) async {
    var dir = await getApplicationDocumentsDirectory();
    var file = new File.fromUri(dir.uri.resolve(pathOrKey));
    await file.delete();

    return true;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: WelcomeScreen(),
    );
  }
}


