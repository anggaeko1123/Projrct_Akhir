import 'package:myflutterapp/tampilanAwal/landing_page/ColorsSys.dart';
import 'package:myflutterapp/tampilanAwal/landing_page/Strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myflutterapp/tampilanAwal/setelahSplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LandingPage(),
  ));
}

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: GestureDetector(
              onTap: () {
                // Navigasi ke halaman login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TampilanAwal()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    color: ColorSys.gray,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                  image: 'assets/landingPage/gambar1.jpg',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              makePage(
                  reverse: true,
                  image: 'assets/landingPage/gambar2.jpg',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent),
              makePage(
                image: 'assets/landingPage/gambar3.jpg',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
                isLast: true, // Tandai halaman terakhir
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false, isLast = false}) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse
              ? Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          )
              : SizedBox(),
          Text(
            title,
            style: TextStyle(
                color: ColorSys.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: ColorSys.gray,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          reverse
              ? Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          )
              : SizedBox(height: 180,),
          if (isLast)
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TampilanAwal()),
                );
              },
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Ubah warna latar belakang sesuai kebutuhan
                onPrimary: Colors.white, // Ubah warna teks sesuai kebutuhan
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: ColorSys.secoundry, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}
