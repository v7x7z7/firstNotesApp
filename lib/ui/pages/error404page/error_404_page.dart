import 'package:flutter/material.dart';

class Error404Page extends StatelessWidget {
  const Error404Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page not found'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Error 404',
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(216, 89, 70, 41),
              fontSize: 26,
          ),
        ),
      ),
    );
  }
}
