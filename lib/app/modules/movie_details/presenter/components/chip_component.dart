import 'package:flutter/material.dart';

class ChipComponent extends StatelessWidget {
  const ChipComponent({
    Key? key,
    required this.label,
    required this.value,
    this.expanded = false,
    this.labelUpperCase = false,
  }) : super(key: key);

  final String label;
  final String value;
  final bool expanded;
  final bool labelUpperCase;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: expanded ? double.maxFinite : null,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: const Color(0xFFF1F3F5),
          borderRadius: BorderRadius.circular(5)),
      child: RichText(
        text: TextSpan(
          text: (labelUpperCase ? label.toUpperCase() : label) + ': ',
          style: const TextStyle(fontSize: 12, color: Color(0xFF868E96)),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: const TextStyle(fontSize: 14, color: Color(0xFF343A40)),
            ),
          ],
        ),
      ),
    );
  }
}
