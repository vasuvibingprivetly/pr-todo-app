import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  final Size size;
  final Color color;
  final IconData icon;
  final String title;
  final String description;

  const TaskContainer({
    required this.size,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.7,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(2, 2),
            blurRadius: 7,
            spreadRadius: 3,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
