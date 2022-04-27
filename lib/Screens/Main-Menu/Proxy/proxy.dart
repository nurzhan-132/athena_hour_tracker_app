import 'package:flutter/material.dart';

class Proxy extends StatefulWidget {
  const Proxy({Key? key}) : super(key: key);

  @override
  _ProxyState createState() => _ProxyState();
}

class _ProxyState extends State<Proxy> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Proxy"),
      ),
    );
  }
}
