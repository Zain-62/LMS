import 'package:flutter/material.dart';

import '../../../utilities/textdetail.dart';

class IntroDetail extends StatelessWidget {
  const IntroDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              DetailScreen(txt: "Platform specific widgets"),
              DetailScreen(txt: "Layout widgets"),
              DetailScreen(txt: "Functions"),
              DetailScreen(txt: "Object Oriented Programming"),
            ],
          ),
        ),
      ),
    );
  }
}
