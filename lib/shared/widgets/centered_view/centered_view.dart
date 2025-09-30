import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {
  final Widget child;
  final double horizontalPadding;
  const CenteredView({super.key, required this.child, this.horizontalPadding=40}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 0),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1200),
        child: child,
      ),
    );
  }
}
