import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/hadith/presentation/view/widgets/hadith_listview.dart';
import 'package:quran/features/hadith/presentation/view_model/hadith_cubit/hadith_cubit.dart';
import 'package:quran/features/hadith/presentation/view_model/hadith_cubit/hadith_states.dart';
import 'package:quran/features/quran/presentation/view/widgets/loading.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: BlocBuilder<HadithCubit, HadithStates>(
        builder: (context, state) {
          if (state is HadithSuccess) {
            return HadithListview(
              ahadith: state.ahadith,
            );
          } else if (state is HadithFailed) {
            return const Text('data');
          } else {
            return const Loading();
          }
        },
      ),
    );
  }
}
