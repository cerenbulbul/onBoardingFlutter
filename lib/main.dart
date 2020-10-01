import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}


/*
There is 3 Splash Screen classes:
    1. OnboardingScreen1()
    2. OnboardingScreen2()
    3. OnboardingScreen3()
    4. OnboardingScreen4()
*/


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OnboardingScreen4(),
    );
  }
}





//OnBoarding Screen 4
class OnboardingScreen4 extends StatefulWidget {
  OnboardingScreen4({Key key}) : super(key: key);

  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingScreen4> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                _buildPageContent(
                    isShowImageOnTop: false,
                    image: 'images/logo_fible.png',
                    body: 'Description.',
                    color: Color.fromRGBO(137, 168, 73, 1)),
                _buildPageContent(
                    isShowImageOnTop: true,
                    image: 'images/logo_fible.png',
                    body: 'Description ',
                    color: Color.fromRGBO(255, 212, 0, 1)),
                _buildPageContent(
                    isShowImageOnTop: false,
                    image: 'images/logo_fible.png',
                    body: 'Description',
                    color: Color.fromRGBO(137, 168, 73, 1))
              ],
            ),
            Positioned(
              bottom: 40,
              left: MediaQuery.of(context).size.width * .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Row(
                      children: [
                        Container(
                          child: Row(children: [
                            for (int i = 0; i < _totalPages; i++) i == _currentPage ? _buildPageIndicator(true) : _buildPageIndicator(false)
                          ]),
                        ),
                        Spacer(),
                        if (_currentPage != 2)
                          InkWell(
                            onTap: () {
                              _pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                              setState(() {});
                            },
                            child: Container(
                              height: 70,
                              alignment: Alignment.center,
                              child: Text(
                                'Skip',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                            ),
                          ),
                        if (_currentPage == 2)
                          InkWell(
                            onTap: () => print('Get Started Now'),
                            child: Container(
                              height: 70,
                              alignment: Alignment.center,
                              child: Text(
                                'Start',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent({String image, String body, Color color, isShowImageOnTop}) {
    return Container(
      decoration: BoxDecoration(color: color),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isShowImageOnTop)
            Column(
              children: [
                Center(
                  child: Image.asset(image,height: 300, width: 300,),
                ),
                SizedBox(height: 50),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, height: 1.6, fontWeight: FontWeight.w800, color: Colors.white),
                ),
              ],
            ),
          if (isShowImageOnTop)
            Column(
              children: [
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, height: 1.6, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                SizedBox(height: 50),
                Center(
                  child: Image.asset(image,height: 300,width: 300,),
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 18.0 : 10.0,
      width: isCurrentPage ? 18.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}










//OnBorading Screen 3
class OnboardingScreen3 extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<OnboardingScreen3> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
        title: "Title",
        description:
        "Description",
        image: "images/logo_fible.png"),
    SliderPage(
        title: "Title",
        description:
        "Description",
        image: "images/logo_fible.png"),
    SliderPage(
        title: "Title",
        description:
        "Description",
        image: "images/logo_fible.png"),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                        EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Color.fromRGBO(137, 168, 73, 1)
                                : Color.fromRGBO(137, 168, 73, 1)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(137, 168, 73, 1),
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                      : Icon(
                    Icons.navigate_next,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  SliderPage({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/logo_fible.png',
            width: width * 0.6,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color.fromRGBO(137, 168, 73, 1)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
              style: TextStyle(
                height: 1.5,
                fontWeight: FontWeight.normal,
                fontSize: 15,
                letterSpacing: 0.7,
                color: Color.fromRGBO(27, 64, 67, 1)
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}













//Onboarding 2
class OnboardingScreen2 extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<OnboardingScreen2> {

  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Color.fromRGBO(137, 168, 73, 1) : Color.fromRGBO(173, 216, 100, 1),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color.fromRGBO(27, 64, 67, 1), const Color.fromRGBO(137, 168, 73, 1)])),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                title: mySLides[0].getTitle(),
                desc: mySLides[0].getDesc(),
              ),
              SlideTile(
                title: mySLides[1].getTitle(),
                desc: mySLides[1].getDesc(),
              ),
              SlideTile(
                title: mySLides[2].getTitle(),
                desc: mySLides[2].getDesc(),
              )
            ],
          ),
        ),
        bottomSheet: slideIndex != 2 ? Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: (){
                  controller.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                },
                splashColor: Color.fromRGBO(173, 216, 100, 1),
                child: Text(
                  "SKIP",
                  style: TextStyle(color: Color.fromRGBO(137, 168, 73, 1), fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    for (int i = 0; i < 3 ; i++) i == slideIndex ? _buildPageIndicator(true): _buildPageIndicator(false),
                  ],),
              ),
              FlatButton(
                onPressed: (){
                  print("this is slideIndex: $slideIndex");
                  controller.animateToPage(slideIndex + 1, duration: Duration(milliseconds: 500), curve: Curves.linear);
                },
                splashColor: Color.fromRGBO(173, 216, 100, 1),
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Color.fromRGBO(137, 168, 73, 1), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ): InkWell(
          onTap: (){
            print("Get Started Now");
          },
          child: Container(
            height: 70,
            color: Color.fromRGBO(137, 168, 73, 1),
            alignment: Alignment.center,
            child: Text(
              "GET STARTED NOW",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String title, desc;

  SlideTile({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/logo_fible.png'),
          SizedBox(
            height: 40,
          ),
          Text(title, textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24,
            color: Color.fromRGBO(137, 168, 73, 1)
          ),),
          SizedBox(
            height: 20,
          ),
          Text(desc, textAlign: TextAlign.center,style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
          color: Color.fromRGBO(27, 64, 67, 1))
          )
        ],
      ),
    );
  }
}

class SliderModel{

  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath,this.title,this.desc});

  void setImageAssetPath(String getImageAssetPath){
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle){
    title = getTitle;
  }

  void setDesc(String getDesc){
    desc = getDesc;
  }

  String getImageAssetPath(){
    return imageAssetPath;
  }

  String getTitle(){
    return title;
  }

  String getDesc(){
    return desc;
  }

}

List<SliderModel> getSlides(){

  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc("Discription");
  sliderModel.setTitle("Title");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc("Description");
  sliderModel.setTitle("Title");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc("Description");
  sliderModel.setTitle("Title");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
















//Onboarding 1
class OnboardingScreen1 extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen1> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color.fromRGBO(137, 168, 73, 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color.fromRGBO(137, 168, 73, 1),
                Color.fromRGBO(119, 151, 63, 1),
                Color.fromRGBO(102, 129, 54, 1),
                Color.fromRGBO(85, 110, 43, 1),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => print('Skip'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/logo_fible.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Title1',
                              style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Description',
                              style: TextStyle(color: Colors.white , fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/logo_fible.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Title 2',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Description',
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'images/logo_fible.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Title 3',
                              style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Description',
                              style: TextStyle(color: Colors.white , fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 50.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: () => print('Get started'),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Color.fromRGBO(137, 168, 73, 1),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : Text(''),
    );
  }
}

