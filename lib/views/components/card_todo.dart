import 'package:flutter/material.dart';
import 'package:to_do_app/utils/all_data.dart';

  Widget productCard({
    required Size size,
    required int index,
    required BuildContext context,
}) {
    return Expanded(
        child: Container(
          height: size.height*0.3,
          decoration: BoxDecoration(
            color: Colors.white38,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(3, 3),
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10),),
          ),
            margin: const EdgeInsets.all(5),
            child:  Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      allTodos[index]['todo'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
    );
  }