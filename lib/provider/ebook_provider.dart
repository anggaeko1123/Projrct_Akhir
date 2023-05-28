import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:myflutterapp/tampilanUser/tampilanUser/api/ebookModel.dart';
import 'package:http/http.dart' as http;

class EbookProvider extends ChangeNotifier {
  static const apiEndpoint =
      'https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data';

  bool isLoading = true;
  String error = '';
  DataDummy dataEbook = DataDummy(data: []);
  DataDummy serachedPets = DataDummy(data: []);
  String searchText = '';

  //
  getDataFromAPI() async {
    try {
      Response response = await http.get(Uri.parse(apiEndpoint));
      if (response.statusCode == 200) {
        dataEbook = dataDummyFromJson(response.body) as DataDummy;
      } else {
        error = response.statusCode.toString();
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    updateData();
  }

  updateData() {
    serachedPets.data.clear();
    if (searchText.isEmpty) {
      serachedPets.data.addAll(dataEbook.data);
    } else {
      serachedPets.data.addAll(dataEbook.data
          .where((element) =>
          element.judul.toLowerCase().startsWith(searchText))
          .toList());
    }
    notifyListeners();
  }

  search(String judul) {
    searchText = judul;
    updateData();
  }
//
}