import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/features/quran/data/get_juz.dart';
import 'package:quran/features/quran/presentation/view_model/juz_cubit/juz_states.dart';

class JuzCubit extends Cubit<JuzStates> {
  JuzCubit() : super(JuzStatesInitial());

  void Juz(int num) async {
    emit(JuzStatesLoading());
    try {
      List<dynamic> juz = await GetJuz().getJuz(num);
      emit(JuzStatesSuccess(juz));
    } on DioException catch (e) {
      emit(JuzStatesFailed(e.toString()));
    } on Exception catch (e) {
      emit(JuzStatesFailed(e.toString()));
    }
  }
}
