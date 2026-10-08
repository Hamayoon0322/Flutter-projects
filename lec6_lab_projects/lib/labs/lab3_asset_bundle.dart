import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Lab3Page extends StatefulWidget {
  const Lab3Page({super.key});
  @override
  State<Lab3Page> createState() => _Lab3PageState();
}

class _Lab3PageState extends State<Lab3Page> {
  late final Future<String> information;
  @override
  void initState() {
    super.initState();
    information = rootBundle.loadString('assets/data/info.txt');
  }

  // Loading bytes and decoding text takes time. A Future keeps the UI responsive.
  // rootBundle is the global application bundle. DefaultAssetBundle.of(context)
  // resolves the nearest inherited bundle, allowing substitution in a subtree
  // or test; prefer it when asset loading should follow the widget context.
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 3 - AssetBundle')),
    body: SafeArea(
      child: FutureBuilder<String>(
        future: information,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Unable to load course information.'),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: SelectableText(
              snapshot.data!,
              style: const TextStyle(fontSize: 18, height: 1.6),
            ),
          );
        },
      ),
    ),
  );
}
