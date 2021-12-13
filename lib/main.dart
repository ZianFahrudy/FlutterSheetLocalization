import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttersheetlocalization/key_constants.dart';
import 'package:fluttersheetlocalization/localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  GetStorage.init();
  runApp(const MyApp());
}

final box = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int language = box.read(KeyConstant.language) ?? 0;
    // log(language.toString());
    return GetMaterialApp(
      locale: language == 0 ? const Locale('id') : const Locale('en'),
      supportedLocales: localizedLabels.keys.toList(),
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

enum Language { id, en }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final selectedLanguage = ValueNotifier<Language?>(null);

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final labels = context.localizations;

    if (box.read(KeyConstant.language) == 1) {
      selectedLanguage.value = Language.en;
    } else {
      selectedLanguage.value = Language.id;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              labels.helloWorld,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.bottomSheet(
              ValueListenableBuilder(
                valueListenable: selectedLanguage,
                builder: (context, _, __) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<Language?>(
                      value: Language.id,
                      groupValue: selectedLanguage.value,
                      selected: selectedLanguage.value == Language.id,
                      onChanged: (value) {
                        selectedLanguage.value = value;
                        storage.write(KeyConstant.language, 0);
                        Get.updateLocale(const Locale('id'));
                      },
                      title: const Text('Bahasa Indonesia'),
                    ),
                    RadioListTile<Language?>(
                      value: Language.en,
                      groupValue: selectedLanguage.value,
                      selected: selectedLanguage.value == Language.en,
                      onChanged: (value) {
                        selectedLanguage.value = value;
                        storage.write(KeyConstant.language, 1);
                        Get.updateLocale(const Locale('en'));
                      },
                      title: const Text('English'),
                    )
                  ],
                ),
              ),
              backgroundColor: Colors.white);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
