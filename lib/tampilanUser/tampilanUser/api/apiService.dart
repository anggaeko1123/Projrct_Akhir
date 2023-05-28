import 'package:http/http.dart' as http;
import 'package:myflutterapp/tampilanUser/tampilanUser/api/apiModel.dart';

class ApiService{
  static final String _baseUrl = 'https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data';

  Future getData() async{
    Uri urlApi = Uri.parse(_baseUrl);

    final response = await http.get(urlApi);
    if(response.statusCode == 200){
      return dataDummyFromJson(response.body.toString());
    }
    else{
      throw Exception("Failed to load data");
    }
  }
}