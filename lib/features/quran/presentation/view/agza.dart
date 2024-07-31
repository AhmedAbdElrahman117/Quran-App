import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quran/constants.dart';
import 'package:quran/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran/features/quran/presentation/view/widgets/juz_surah.dart';
import 'package:quran/features/quran/presentation/view_model/juz_cubit/juz_cubit.dart';

class Agza extends StatelessWidget {
  const Agza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 30,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ListItem(
                  icon: FontAwesomeIcons.bookQuran,
                  title: 'جزء  ${index + 1}',
                  onTap: () {
                    BlocProvider.of<JuzCubit>(context).Juz(index + 1);
                    Get.to(
                      () => const JuzSurah(),
                      transition: kmainTrans,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
