import 'package:quran/core/api_service.dart';

class GetAllSurahs {
  Future<List<String>> get() async {
    List res = await ApiService()
        .get(Link: 'https://quranapi.pages.dev/api/surah.json');

    List<String> surahs = [];
    for (int i = 0; i < res.length; i++) {
      surahs.add(res[i]['surahNameArabicLong']);
    }
    return surahs;
  }
}
