import 'package:flutter/material.dart';

class LogoF1 extends StatelessWidget {
  const LogoF1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Image.asset(
        'assets/images/f1.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
