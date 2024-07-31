import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran/features/hadith/presentation/view_model/hadith_cubit/hadith_cubit.dart';
import 'package:quran/features/home/presentation/view/home_view.dart';
import 'package:quran/features/quran/presentation/view_model/all_surahs_cubit/all_surahs_cubit.dart';
import 'package:quran/features/quran/presentation/view_model/juz_cubit/juz_cubit.dart';
import 'package:quran/features/quran/presentation/view_model/surah_cubit/surah_cubit.dart';
import 'package:quran/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';

void main() async {
  await GetStorage.init();

  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AllSurahsCubit(),
        ),
        BlocProvider(
          create: (context) => SurahCubit(),
        ),
        BlocProvider(
          create: (context) => JuzCubit(),
        ),
        BlocProvider(
          create: (context) => HadithCubit(),
        ),
        BlocProvider(
          create: (context) => TasbihCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        theme: ThemeData(
          fontFamily: 'Almarai',
        ),
        home: const HomeView(),
      ),
    );
  }
}
