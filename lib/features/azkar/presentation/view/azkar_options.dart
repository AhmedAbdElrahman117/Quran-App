import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quran/features/home/presentation/view/widgets/list_item.dart';

class AzkarOptions extends StatelessWidget {
  const AzkarOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListItem(
              icon: FontAwesomeIcons.personPraying,
              title: '',
            );
          },
        ),
      ),
    );
  }
}
