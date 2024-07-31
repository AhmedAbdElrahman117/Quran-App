import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/quran/presentation/view/widgets/loading.dart';
import 'package:quran/features/quran/presentation/view/widgets/surah.dart';
import 'package:quran/features/quran/presentation/view_model/surah_cubit/surah_cubit.dart';
import 'package:quran/features/quran/presentation/view_model/surah_cubit/surah_states.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEEBDD),
      body: SafeArea(
        child: BlocBuilder<SurahCubit, SurahStates>(
          builder: (context, state) {
            if (state is SurahSuccess) {
              return Surah(
                surah: state.data,
              );
            } else if (state is SurahFailed) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return const Loading();
            }
          },
        ),
      ),
    );
  }
}
