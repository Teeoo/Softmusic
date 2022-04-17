import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:overlay_support/overlay_support.dart';

void main() {
  runApp(const App());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const OverlaySupport.global(
        child: NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      home: MyHomePage(title: 'Soft Music'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: NeumorphicText(widget.title),
      ),
      body: Center(
        child: NeumorphicText(
          "I love soft music",
          style: const NeumorphicStyle(
            depth: 4,
            color: Colors.white,
          ),
          textStyle: NeumorphicTextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
