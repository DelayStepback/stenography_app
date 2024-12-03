import 'package:flutter/material.dart';

class BottomSheetTrigger extends StatelessWidget {
  const BottomSheetTrigger({required this.height, super.key});
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: const Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.grey,
          ),
          child: SizedBox(
            height: 5,
            width: 60,
          ),
        ),
      ),
    );
  }
}
