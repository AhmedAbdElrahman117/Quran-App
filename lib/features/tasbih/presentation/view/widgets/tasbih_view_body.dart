import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/constants.dart';
import 'package:quran/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_cubit.dart';
import 'package:quran/features/tasbih/presentation/view_model/tasbih_cubit/tasbih_states.dart';

class TasbihViewBody extends StatelessWidget {
  const TasbihViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;

    return BlocBuilder<TasbihCubit, TasbihStates>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: kTextColor,
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '${BlocProvider.of<TasbihCubit>(context).counter}',
                  style: const TextStyle(
                    fontSize: 28,
                    color: kTextColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Text(
              'مجموع التسبيحات: ${BlocProvider.of<TasbihCubit>(context).total}',
              style: const TextStyle(
                fontSize: 20,
                color: kTextColor,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<TasbihCubit>(context).counterClear();
                  },
                  child: null,
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(
                      side: BorderSide(
                        color: kTextColor,
                      ),
                    ),
                    fixedSize: Size(width * 0.18, height * 0.08),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 100),
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TasbihCubit>(context).counterIncrease();
                },
                child: null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 120, vertical: 120),
                  backgroundColor: kTextColor,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
