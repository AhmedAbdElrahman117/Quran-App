import 'package:quran/core/api_service.dart';

class GetHadith {
  Future<List<String>> get(
      {required String name, required int from, required int to}) async {
    var res = await ApiService()
        .get(Link: 'https://api.hadith.gading.dev/books/$name?range=$from-$to');

    List data = res['data']['hadiths'];
    List<String> hadiths = [];

    for (int i = 0; i < data.length; i++) {
      hadiths.add(data[i]['arab']);
    }
    return hadiths;
  }
}
