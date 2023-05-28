import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myflutterapp/dataEbook/dummyData.dart';
import 'package:myflutterapp/dataEbook/ebookData.dart';
import 'package:myflutterapp/provider/ebook_provider.dart';
import 'package:myflutterapp/tampilanUser/tampilanUser/detailEbook.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:myflutterapp/tampilanUser/tampilanUser/api/apiModel.dart';

class MySearchBarApp extends StatefulWidget {
  MySearchBarApp({Key? key}) : super(key: key);

  @override
  State<MySearchBarApp> createState() => _MySearchBarAppState();
}

class _MySearchBarAppState extends State<MySearchBarApp> {
  TextEditingController controller = TextEditingController();
  List<DataDummy> _searchResult = [];
  List<DataDummy> _userDetail = [];
  // final String url = 'https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data';
  
  Future<Null> getUserDetail() async {
    final response = await http.get(Uri.parse('https://633fdc42e44b83bc73c2d9be.mockapi.io/api/data'));
    // final response = await http.get(url as Uri);
    final responseJson = json.decode(response.body);
    
    setState(() {
      for(Map user in responseJson){
        _userDetail.add(DataDummy.fromJson(user as Map<String, dynamic>));
      }
    });
  }

  @override
  void initState(){
    super.initState();

    getUserDetail();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('search'),
      // ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                color: Colors.white30,
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'search ......',
                      border: InputBorder.none
                    ),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: (){
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: -_searchResult.length != 0 || controller.text.isNotEmpty
                  ? ListView.builder(
                  itemCount: _searchResult.length,
                  itemBuilder: (context, i){
                    final EbookData ebook = ebooks[i];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return EbookDetail(
                              ebook: ebooks[i],
                            );
                          }));
                        },
                        child: ListTile(
                          title: Text(
                            _searchResult[i].judul,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                          subtitle: Text(_searchResult[i].rating),
                        ),
                      ),
                    );
                  }
              )
                  : ListView.builder(
                  itemBuilder: (context, index){
                    final EbookData ebook = ebooks[index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return EbookDetail(
                              ebook: ebooks[index],
                            );
                          }));
                        },
                        child: ListTile(
                          title: Text(
                            _userDetail[index].judul,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),
                          ),
                          subtitle: Text(_userDetail[index].rating),
                        ),
                      ),
                    );
                  }
              )
          )
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async{
    _searchResult.clear();
    if(text.isEmpty){
      setState(() {
        return;
      });
    }
    _userDetail.forEach((userDetail) {
      if(userDetail.judul.contains(text) || userDetail.rating.contains(text))
        _searchResult.add(userDetail);
    });

    setState(() {

    });
  }
}
