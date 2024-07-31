import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quran/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_states.dart';

class TasbihCubit extends Cubit<TasbihStates> {
  TasbihCubit() : super(TasbihInitial());

  final box = GetStorage();

  int counter = 0;

  int total = 0;

  void counterInit() {
    total = box.read('totalcounter') ?? 0;
  }

  void counterIncrease() {
    emit(TasbihIncreased());
    box.write('totalcounter', ++total);
    ++counter;
  }

  void counterClear() {
    emit(TasbihClear());
    counter = 0;
  }
}
