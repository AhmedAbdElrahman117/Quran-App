// ignore_for_file: must_be_immutable

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:quran/constants.dart';
import 'package:quran/features/hadith/data/get_hadith.dart';
import 'package:quran/features/hadith/presentation/view/widgets/hadith_item.dart';

class HadithListview extends StatefulWidget {
  HadithListview({super.key, required this.ahadith});
  final List<String> ahadith;
  late String name;
  int from = 51;
  int to = 100;
  bool isLoading = false;
  String error = '';

  @override
  State<HadithListview> createState() => _HadithListviewState();
}

class _HadithListviewState extends State<HadithListview> {
  final ScrollController x = ScrollController();

  @override
  void initState() {
    widget.name = widget.ahadith.last;
    widget.ahadith.removeLast();
    x.addListener(checkListView);
    super.initState();
  }

  void checkListView() async {
    if (x.position.pixels == x.position.maxScrollExtent) {
      widget.isLoading = true;
      setState(() {});
      await fetchData();
      x.position.animateTo(
        x.position.pixels + 400,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
      widget.isLoading = false;
      setState(() {});
    }
  }

  fetchData() async {
    try {
      List<String> accept = await GetHadith()
          .get(name: widget.name, from: widget.from, to: widget.to);
      widget.ahadith.addAll(accept);
      widget.to += 50;
      widget.from += 50;
      setState(() {});
    } on DioException catch (e) {
      widget.error = e.toString();
    } on Exception catch (e) {
      widget.error = e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: const CircularProgressIndicator(
        color: kTextColor,
      ),
      inAsyncCall: widget.isLoading,
      child: widget.error.isEmpty
          ? ListView.builder(
              controller: x,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.ahadith.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: HadithItem(
                    text: widget.ahadith[index],
                  ),
                );
              },
            )
          : Text(
              widget.error.toString(),
            ),
    );
  }
}
