import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:quran/constants.dart';
import 'package:quran/features/azkar/presentation/view/azkar_options.dart';
import 'package:quran/features/hadith/presentation/view/hadith_options.dart';
import 'package:quran/features/home/presentation/view/widgets/list_item.dart';
import 'package:quran/features/quran/presentation/view/quran_options.dart';
import 'package:quran/features/tasbih/presentation/view/tasbih_view.dart';
import 'package:quran/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      FontAwesomeIcons.bookQuran,
      Icons.mosque,
      FontAwesomeIcons.personPraying,
      Icons.timer,
    ];
    List<String> title = [
      'القرءان الكريم',
      'احاديث',
      'أذكار',
      'تسبيح',
    ];
    List<Widget> dist = [
      const QuranOptions(),
      const HadithOptions(),
      const AzkarOptions(),
      const TasbihView(),
    ];
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: title.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 40),
          child: ListItem(
            icon: icons[index],
            title: title[index],
            onTap: () {
              if (index == 3) {
                BlocProvider.of<TasbihCubit>(context).counterInit();
              }
              if (index != 2) {
                Get.to(
                  () => dist[index],
                  transition: kmainTrans,
                );
              } else {
                Get.defaultDialog(
                  title: 'Not Available Yet',
                  titlePadding: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  titleStyle: const TextStyle(
                    color: kTextColor,
                  ),
                  middleText: 'Soon',
                  middleTextStyle: const TextStyle(
                    color: kTextColor,
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
