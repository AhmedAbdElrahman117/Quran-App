import 'package:quran/core/api_service.dart';

class GetJuz {
  getJuz(int num) async {
    Map res = await ApiService()
        .get(Link: 'https://api.alquran.cloud/v1/juz/$num/quran-uthmani');
    List<dynamic> ayahs = res['data']['ayahs'];
    List<dynamic> data = [];
    for (int i = 0; i < ayahs.length; i++) {
      data.add(ayahs[i]['text']);
    }
    return data;
  }
}
