import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hello_app/view/language_page.dart';
import 'package:hello_app/view/news_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Online Bank'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _toggleSelectedPage = 0;
  final List<bool> _selections = List.generate(2, (index) => false);
  PageController pageController = PageController();
  PageController togglePageController = PageController();

  void doNothing() {
    print("DOING NOTHING!");
  }

  void _onToggleSelected(int index) {
    setState(() {
      _toggleSelectedPage = index;
    });
    togglePageController.jumpToPage(index);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }



  ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.red),
      padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_sharp),
            label: 'Rates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_sharp),
            label: 'News',
          )
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red[500],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            //TODO HOME
            Container(
              color: Colors.red,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: const Text("Home"),
                ),
                body: Column(
                  children: [
                    //ADS
                    Container(
                      child: CarouselSlider(
                        items: [
                          Container(
                            child: Image.network(
                                "https://i.pinimg.com/originals/95/2a/7d/952a7d3260cdaedd1852dad5d00906d8.jpg"),
                          ),
                          Container(
                            child: Image.network(
                                "https://pbs.twimg.com/media/DAhLFpJXsAYwzXj.jpg"),
                          )
                        ],
                        options: CarouselOptions(),
                      ),
                    ),
                    //ENTER, CONTACTS, LANGUAGE
                    Container(
                      height: MediaQuery.of(context).size.width * .70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: ElevatedButton(
                                onPressed: doNothing,
                                style: style,
                                child: const Text("Login")),
                            width: 200,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                                onPressed: doNothing,
                                style: style,
                                child: const Text("Contacts")),
                            width: 200,
                          ),
                          SizedBox(
                            child: ElevatedButton(
                                onPressed: doNothing,
                                style: style,
                                child: const Text("Language")),
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //TODO MAP
            Container(
              color: Colors.red,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("ATMs & Offices"),
                ),
                body: Column(children: [
                  ToggleButtons(
                    isSelected: _selections,
                    children: [
                      Text("On map"),
                      Text("List"),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        _onToggleSelected(index);
                      });
                    },
                  ),
                  Expanded(child: PageView(
                    controller: togglePageController,
                    children: [
                      Container(
                        child: Text("Map"),
                      ),
                      Container(
                        child: Text("List"),
                      ),
                    ],
                  ))
                ]),
              ),
            ),
            //TODO RATES
            Container(
              color: Colors.green,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("Rates"),
                ),
              ),
            ),
            //TODO NEWS
            Container(
              color: Colors.yellow,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("News"),
                ),
                body: ListView(
                  children: const [
                    NewsWidget("10.11.2021",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore."),
                    NewsWidget("9.11.2021",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore."),
                    NewsWidget("5.11.2021",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore."),
                    NewsWidget("4.11.2021",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore."),
                    NewsWidget("4.11.2021",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore."),
                    NewsWidget("2.11.2021",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore."),
                    NewsWidget("1.11.2021", "Happy birthday to me!!!."),
                    NewsWidget("25.10.2021",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore."),
                    NewsWidget("13.10.2021",
                        "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
