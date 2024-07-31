import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/hadith/data/get_hadith.dart';
import 'package:quran/features/hadith/presentation/view_model/hadith_cubit/hadith_states.dart';

class HadithCubit extends Cubit<HadithStates> {
  HadithCubit() : super(HadithInitial());

  void getAhadith(
      {required String name, required int from, required int to}) async {
    emit(HadithLoading());
    try {
      List<String> ahadith =
          await GetHadith().get(name: name, from: from, to: to);
      ahadith.add(name);
      emit(HadithSuccess(ahadith));
    } on DioException catch (e) {
      emit(HadithFailed(e.toString()));
    }
  }
}
