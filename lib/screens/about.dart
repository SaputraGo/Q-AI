import 'package:flutter/material.dart';
import 'package:qai/shared/shared.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('about'), backgroundColor: Colors.blue),

      body: Center(child: Loader(),),
    );
  }
}