import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quran/constants.dart';
import 'package:quran/features/hadith/presentation/view/hadith_view.dart';
import 'package:quran/features/hadith/presentation/view_model/hadith_cubit/hadith_cubit.dart';
import 'package:quran/features/home/presentation/view/widgets/list_item.dart';

class HadithOptions extends StatelessWidget {
  const HadithOptions({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> title = {
      'bukhari': 'رواه البخاري',
      'muslim': 'رواه مسلم',
      'tirmidzi': 'رواه الترمذي',
      'malik': 'رواه مالك',
      'abu-daud': 'رواه ابو داود',
      'ahmad': 'رواه أحمد',
      'darimi': 'رواه الدرامي',
      'ibnu-majah': 'رواه ابن ماجه',
      'nasai': 'رواه نسائي',
    };
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: title.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: ListItem(
                icon: Icons.person,
                title: title.values.toList()[index],
                onTap: () {
                  BlocProvider.of<HadithCubit>(context).getAhadith(
                    name: title.keys.toList()[index],
                    from: 1,
                    to: 50,
                  );
                  Get.to(
                    () => const HadithView(),
                    transition: kmainTrans,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
