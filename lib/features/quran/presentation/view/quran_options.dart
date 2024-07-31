import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quran/constants.dart';
import 'package:quran/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran/features/quran/presentation/view/agza.dart';
import 'package:quran/features/quran/presentation/view/quran_view.dart';
import 'package:quran/features/quran/presentation/view_model/all_surahs_cubit/all_surahs_cubit.dart';

class QuranOptions extends StatelessWidget {
  const QuranOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ListItem(
                icon: FontAwesomeIcons.bookQuran,
                title: 'سور',
                onTap: () {
                  BlocProvider.of<AllSurahsCubit>(context).allSurahs();
                  Get.to(
                    () => const QuranView(),
                    transition: kmainTrans,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ListItem(
                icon: FontAwesomeIcons.bookQuran,
                title: 'اجزاء',
                onTap: () {
                  Get.to(
                    () => const Agza(),
                    transition: kmainTrans,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
