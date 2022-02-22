import 'package:flutter/material.dart';

class CardInformationsComponent extends StatelessWidget {
  const CardInformationsComponent(
      {Key? key, required this.label, required this.information})
      : super(key: key);

  final String label;
  final String information;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Color(0xFF5E6770)),
          ),
          const SizedBox(height: 8),
          Text(
            information,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF343A40),
            ),
          ),
        ],
      ),
    );
  }
}
