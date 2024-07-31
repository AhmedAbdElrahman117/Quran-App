import 'package:dio/dio.dart';
import 'package:quran/features/quran/data/get_all_surahs.dart';
import 'package:quran/features/quran/presentation/view_model/all_surahs_cubit/all_surahs_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllSurahsCubit extends Cubit<AllSurahsStates> {
  AllSurahsCubit() : super(AllSurahsInitial());

  void allSurahs() async {
    emit(AllSurahsLoading());
    try {
      List<String> allSurahs = await GetAllSurahs().get();
      emit(AllSurahsSuccess(allSurahs));
    } on DioException catch (e) {
      emit(AllSurahsFailed(e.toString()));
    } on Exception catch (e) {
      emit(AllSurahsFailed(e.toString()));
    }
  }
}
