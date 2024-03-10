import 'package:flutter/material.dart';
import '../../utils/all_data.dart';

Widget todoCard({
  required Size size,
  required int index,
  required BuildContext context,
}) {
  return Container(
    height: 180, // Adjusted height
    margin: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task ID: ${allTodos[index]['id']}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Task: ${allTodos[index]['todo']}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent), // Add border
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'User ID: ${allTodos[index]['userId']}',
              style: const TextStyle(
                fontSize: 16, // Increased font size
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
