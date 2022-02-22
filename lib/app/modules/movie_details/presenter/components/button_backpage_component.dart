import 'package:flutter/material.dart';

class ButtonBackpageComponent extends StatelessWidget {
  const ButtonBackpageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 3))
          ],
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.arrow_back_ios, size: 12, color: Color(0xFF5E6770)),
            Text('Voltar',
                style: TextStyle(
                    color: Color(0xFF3C3D4A),
                    fontSize: 12,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
