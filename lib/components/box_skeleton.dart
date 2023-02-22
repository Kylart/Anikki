import 'package:flutter/material.dart';

Widget skeletonBox() {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey,
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
