import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quran/constants.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final TextEditingController control = TextEditingController(text: text);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton.filledTonal(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            style: IconButton.styleFrom(
              backgroundColor: kBackgroundColor,
            ),
            onPressed: () async {
              await Clipboard.setData(
                ClipboardData(text: control.text),
              );
              Get.snackbar(
                'Copied',
                'Copied To Clipboard',
              );
            },
            icon: const Icon(
              Icons.copy,
              color: kTextColor,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            minLines: 1,
            maxLines: text.length,
            readOnly: true,
            enabled: false,
            controller: control,
            canRequestFocus: false,
            style: const TextStyle(
              color: kTextColor,
              fontSize: 20,
            ),
            decoration: InputDecoration(
              fillColor: kBackgroundColor,
              filled: true,
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: kTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
