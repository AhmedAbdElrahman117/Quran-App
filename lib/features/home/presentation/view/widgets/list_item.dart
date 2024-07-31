import 'package:flutter/material.dart';
import 'package:quran/constants.dart';

class ListItem extends StatelessWidget {
  const ListItem(
      {super.key, required this.icon, required this.title, this.onTap});

  final IconData icon;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 55,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.circular(15),
            border: const Border(
              right: BorderSide(
                width: 10,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: kTextColor,
              ),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Icon(
                icon,
                color: kTextColor,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xFFA5583A),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
