import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.isDialog = false});
  final bool isDialog;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDialog ? Colors.white : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
