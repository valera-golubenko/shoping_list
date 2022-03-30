import 'package:flutter/material.dart';

import 'pages/home_p.dart';

void main() {
  runApp(const MainW());
}

class MainW extends StatelessWidget {
  const MainW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeP(),
      debugShowCheckedModeBanner: false,
    );
  }
}
