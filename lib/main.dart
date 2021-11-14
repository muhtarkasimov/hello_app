import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hello_app/view/address_widget.dart';
import 'package:hello_app/view/language_page.dart';
import 'package:hello_app/view/news_widget.dart';
import 'package:hello_app/view/rates_widget.dart';

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
  int _selectedToggleIndex = 0;
  final List<bool> _selections = [true, false];
  PageController pageController = PageController();
  PageController togglePageController = PageController();

  void doNothing() {
    print("DOING NOTHING!");
  }

  void _onToggleSelected(int index) {
    setState(() {
      _selectedToggleIndex = index;
      if (_selections[index] == false) {
        _selections[index] = !_selections[index];
        if (index == 0) {
          _selections[index + 1] = !_selections[index + 1];
        } else {
          _selections[index - 1] = !_selections[index - 1];
        }
      }
    });
    togglePageController.jumpToPage(_selectedToggleIndex);
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
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("ATMs & Offices"),
                ),
                body: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: ToggleButtons(
                      isSelected: _selections,
                      children: [
                        Container(
                          color: (_selections[0]) ? Colors.red : Colors.white,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.495,
                          child: Text(
                            "On map",
                            style: TextStyle(
                                color:
                                    _selections[0] ? Colors.white : Colors.red),
                          ),
                        ),
                        Container(
                          color: (_selections[1]) ? Colors.red : Colors.white,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.495,
                          child: Text(
                            "List",
                            style: TextStyle(
                                color:
                                    _selections[1] ? Colors.white : Colors.red),
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        _onToggleSelected(index);
                      },
                    ),
                  ),
                  Expanded(
                      child: PageView(
                    onPageChanged: _onToggleSelected,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: togglePageController,
                    children: [
                      Container(
                        child: Image.network(
                            "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg"),
                      ),
                      Container(
                        child: ListView(
                          children: const [
                            AddressWidget(
                                "ATM", "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget(
                                "ATM", "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget("Terminal",
                                "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget("Terminal",
                                "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget(
                                "ATM", "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget("Terminal",
                                "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget(
                                "ATM", "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget("Terminal",
                                "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget(
                                "ATM", "BBC Bank Jorge st. ChinaTown 29/1"),
                            AddressWidget("Terminal",
                                "BBC Bank Jorge st. ChinaTown 29/1"),
                          ],
                        ),
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
                body: ListView(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Buy price"),
                            Text("Sell price"),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      alignment: Alignment.topLeft,
                      color: Colors.red,
                      child: const Text("Cash courses", style: TextStyle(color: Colors.white),),
                    ),
                    RatesWidget("USD", "84.54", "83.45"),
                    RatesWidget("RUR", "84.54", "83.45"),
                    RatesWidget("KZT", "84.54", "83.45"),
                    RatesWidget("TLR", "84.54", "83.45"),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      alignment: Alignment.topLeft,
                      color: Colors.red,
                      child: const Text("Cashless courses", style: TextStyle(color: Colors.white),),
                    ),
                    RatesWidget("USD", "84.54", "83.45"),
                    RatesWidget("RUR", "84.54", "83.45"),
                    RatesWidget("KZT", "84.54", "83.45"),
                    RatesWidget("TLR", "84.54", "83.45"),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      alignment: Alignment.topLeft,
                      color: Colors.red,
                      child: const Text("Payment card courses", style: TextStyle(color: Colors.white),),
                    ),
                    RatesWidget("USD", "84.54", "83.45"),
                    RatesWidget("RUR", "84.54", "83.45"),
                    RatesWidget("KZT", "84.54", "83.45"),
                    RatesWidget("TLR", "84.54", "83.45"),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      alignment: Alignment.topLeft,
                      color: Colors.red,
                      child: const Text("Blockchain courses", style: TextStyle(color: Colors.white),),
                    ),
                    RatesWidget("USD", "84.54", "83.45"),
                    RatesWidget("RUR", "84.54", "83.45"),
                    RatesWidget("KZT", "84.54", "83.45"),
                    RatesWidget("TLR", "84.54", "83.45"),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                      alignment: Alignment.topLeft,
                      color: Colors.red,
                      child: const Text("Courses of drama", style: TextStyle(color: Colors.white),),
                    ),
                    RatesWidget("USD", "84.54", "83.45"),
                    RatesWidget("RUR", "84.54", "83.45"),
                    RatesWidget("KZT", "84.54", "83.45"),
                    RatesWidget("TLR", "84.54", "83.45"),

                  ],
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
