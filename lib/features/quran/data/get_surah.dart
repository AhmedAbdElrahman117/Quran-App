import 'package:quran/core/api_service.dart';

class GetSurah {
  get(int num) async {
    Map res = await ApiService()
        .get(Link: 'https://api.alquran.cloud/v1/surah/$num/ar.alafasy');
    List x = res['data']['ayahs'];
    List<dynamic> data = [];

    for (int i = 0; i < x.length; i++) {
      data.add(x[i]['text']);
    }
    return data;
  }
}
