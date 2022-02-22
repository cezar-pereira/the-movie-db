import 'package:flutter/material.dart';

class ChipTransparentComponent extends StatelessWidget {
  const ChipTransparentComponent({
    Key? key,
    required this.value,
  }) : super(key: key);

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE9ECEF),
          ),
          borderRadius: BorderRadius.circular(5)),
      child: Text(value),
    );
  }
}
