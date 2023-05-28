import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:myflutterapp/model/dataModel.dart';
import 'package:myflutterapp/tampilanUser/beranda/beranda.dart';
import 'package:myflutterapp/tampilanUser/beranda/searchBar/searchView.dart';
import 'package:myflutterapp/tampilanUser/pengaturan/pengaturan.dart';
import 'package:myflutterapp/tampilanUser/tampilanUser/tampilanUserNew.dart';
import 'package:myflutterapp/tampilanUser/wishlist/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavBar extends StatefulWidget{

  @override
  State<BottomNavBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavBar>{

  late DataModel data;

  int _currentIndex = 0;
  late PageController _pageController;

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? access_token = prefs.getString('access_token');
    if (access_token != null) {
      print('Access Token: $access_token');
    } else {
      print('Access Token not found');
    }
  }

  @override
  void initState(){
    super.initState();
    getToken();
    _pageController = PageController();
  }

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        body: SizedBox.expand(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index){
              setState((){
                _currentIndex = index;
              });
            },
            children: [
              TampilanUserNew(),
              MySearchBarApp(),
              // Beranda(),
              Wishlist(),
              Pengaturan(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
          selectedIndex: _currentIndex,
          onItemSelected: (index){
            setState(() {
              _pageController.jumpToPage(index);
            });
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(Icons.home, color: Colors.black,),
                title: Text('Home',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
                activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),

            BottomNavyBarItem(
                icon: Icon(Icons.search, color: Colors.black,),
                title: Text('Cari',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),

            // BottomNavyBarItem(
            //     icon: Icon(Icons.abc, color: Colors.black,),
            //     title: Text('Basa-Basi'),
            //   activeColor: Colors.blue,
            //   textAlign: TextAlign.center,
            // ),

            BottomNavyBarItem(
                icon: Icon(Icons.favorite_outlined,
                  color: Colors.black,),
                title: Text('Wishlist',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),

            BottomNavyBarItem(
                icon: Icon(Icons.settings,),
                title: Text('Pengaturan',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}