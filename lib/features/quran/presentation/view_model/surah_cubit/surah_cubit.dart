import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/quran/data/get_surah.dart';
import 'package:quran/features/quran/presentation/view_model/surah_cubit/surah_states.dart';

class SurahCubit extends Cubit<SurahStates> {
  SurahCubit() : super(SurahInitial());

  void surah(int num) async {
    emit(SurahLoading());
    try {
      List<dynamic> data = await GetSurah().get(num);
      emit(SurahSuccess(data));
    } on DioException catch (e) {
      emit(SurahFailed(e.toString()));
    }
  }
}
