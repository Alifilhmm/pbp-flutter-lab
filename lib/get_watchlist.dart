import 'package:counter_7/model_watchlist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<MyWatchlist>> fetchWatchlist() async {
  var url = Uri.parse('https://mocki.io/v1/54570e9d-f829-4055-99f0-856d42f3d7eb');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchlist
  List<MyWatchlist> listWatchlist = [];
  for (var d in data) {
    if (d != null) {
      listWatchlist.add(MyWatchlist.fromJson(d));
    }
  }

  return listWatchlist;
}