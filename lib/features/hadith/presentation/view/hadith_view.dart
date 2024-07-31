import 'package:flutter/material.dart';
import 'package:quran/features/hadith/presentation/view/widgets/hadith_view_body.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HadithViewBody(),
      ),
    );
  }
}
