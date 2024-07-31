import 'package:flutter/material.dart';
import 'package:quran/features/quran/presentation/view/widgets/ayah.dart';

class Surah extends StatelessWidget {
  const Surah({super.key, required this.surah});

  final List<dynamic> surah;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEBDD),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          for (int i = 0; i < surah.length; i++)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Ayah(text: surah[i], num: i + 1),
              ),
            ),
          const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'صَدَقَ اللهُ العَلِيُّ العَظيمْ',
                style: TextStyle(
                  height: 3,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
