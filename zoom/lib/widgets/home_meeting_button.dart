import 'package:flutter/material.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  final Color color;

  HomeMeetingButton({
    required this.onPressed,
    required this.icon,
    required this.text, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 97,
      child: GestureDetector(

        onTap: onPressed,
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon,  color: Colors.white,
                size: 30,),

            ),
            const SizedBox(height: 10),
            Text(
              text,textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
