import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/quran/presentation/view/widgets/ayah.dart';
import 'package:quran/features/quran/presentation/view/widgets/loading.dart';
import 'package:quran/features/quran/presentation/view_model/juz_cubit/juz_cubit.dart';
import 'package:quran/features/quran/presentation/view_model/juz_cubit/juz_states.dart';

class JuzSurah extends StatelessWidget {
  const JuzSurah({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEBDD),
      body: BlocBuilder<JuzCubit, JuzStates>(
        builder: (context, state) {
          if (state is JuzStatesSuccess) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                for (int i = 0; i < state.juz.length; i++)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Ayah(text: state.juz[i], num: i + 1),
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
            );
          } else if (state is JuzStatesFailed) {
            return Center(
              child: Text(state.errMessage),
            );
          } else {
            return const Loading();
          }
        },
      ),
    );
  }
}
