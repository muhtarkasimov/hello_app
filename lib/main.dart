import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        primarySwatch: Colors.blue,
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
  PageController pageController = PageController();

  void doNothing() {
    print("DOING NOTHING!");
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  ButtonStyle style = ButtonStyle(
    side: MaterialStateProperty.all(
      BorderSide.lerp(
          BorderSide(
            style: BorderStyle.solid,
            color: Color(0xffe4e978),
            width: 10.0,
          ),
          BorderSide(
            style: BorderStyle.solid,
            color: Color(0xffe4e978),
            width: 10.0,
          ),
          10.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
          controller: pageController,
          children: [
            //TODO HOME
            Container(
              color: Colors.red,
              child: Column(
                children: [
                  //ADS
                  Container(
                    child: CarouselSlider(
                      items: [
                        Container(
                          child: Image.network(
                              "https://pbs.twimg.com/media/Ectpl-gXgAEl_aD.jpg"),
                        ),
                        Container(
                          child: Image.network(
                              "https://pbs.twimg.com/media/Eg0L-FfXYAQ3Coj.jpg"),
                        )
                      ],
                      options: CarouselOptions(),
                    ),
                  ),
                  //ENTER, CONTACTS, LANGUAGE
                  Container(
                    child: Column(
                      children: [
                        OutlinedButton(
                            onPressed: doNothing,
                            style: style,
                            child: const Text("Enter")),
                        ElevatedButton(
                            onPressed: doNothing,
                            style: style,
                            child: const Text("Contacts")),
                        ElevatedButton(
                            onPressed: doNothing,
                            style: style,
                            child: const Text("Language")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //TODO MAP
            Container(
              color: Colors.blue,
            ),
            //TODO RATES
            Container(
              color: Colors.green,
            ),
            //TODO NEWS
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
