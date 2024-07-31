import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quran/constants.dart';
import 'package:quran/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran/features/quran/presentation/view/surah_view.dart';
import 'package:quran/features/quran/presentation/view/widgets/loading.dart';
import 'package:quran/features/quran/presentation/view_model/all_surahs_cubit/all_surahs_cubit.dart';
import 'package:quran/features/quran/presentation/view_model/all_surahs_cubit/all_surahs_states.dart';
import 'package:quran/features/quran/presentation/view_model/surah_cubit/surah_cubit.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: BlocBuilder<AllSurahsCubit, AllSurahsStates>(
          builder: (context, state) {
            if (state is AllSurahsSuccess) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.surahs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ListItem(
                      icon: FontAwesomeIcons.bookOpen,
                      title: state.surahs[index],
                      onTap: () async {
                        BlocProvider.of<SurahCubit>(context).surah(index + 1);
                        Get.to(
                          () => SurahView(),
                          transition: kmainTrans,
                        );
                      },
                    ),
                  );
                },
              );
            } else if (state is AllSurahsFailed) {
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
