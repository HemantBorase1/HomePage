import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    VideoCallScreen(),
    AiBotScreen(),
    HistoryScreen(),
    MedicalReportScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: 'Video Call'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'AI Bot'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Medical Report'),
        ],
      ),
    );
  }
}

// Home Screen with Horizontal Banner Slider and Services Grid
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.person, color: Colors.black),
        title: Text("Hey, Joy", style: TextStyle(color: Colors.black)),
        actions: [
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Horizontal Banner Slider with PageView
            Container(
              height: 200,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,  // Changed to horizontal
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      BannerImage(imagePath: 'assets/background.png'),
                      BannerImage(imagePath: 'assets/Bed.jpg'),
                      BannerImage(imagePath: 'assets/Emergency.jpg'),

                    ],
                  ),
                  // Horizontal Page Indicator
                  Positioned(
                    bottom: 16,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index ? Colors.white : Colors.white54,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            // Services Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Our Services", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(onPressed: () {}, child: Text("See All")),
                ],
              ),
            ),
            // Service Tiles
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              children: [
                ServiceTile(title: "Beds Availability", image: 'assets/Bed.jpg'),
                ServiceTile(title: "OPD's Schemes", image: 'assets/Opd.png'),
                ServiceTile(title: "X-Ray", image: 'assets/Xray.png'),
                ServiceTile(title: "Book Appointment", image: 'assets/appoint.jpg'),
                ServiceTile(title: "Emergency Services", image: 'assets/Emergency.jpg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for each banner image in the horizontal slider
class BannerImage extends StatelessWidget {
  final String imagePath;

  BannerImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// Service Tile with Background Image
class ServiceTile extends StatelessWidget {
  final String title;
  final String image;

  ServiceTile({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(

          padding: EdgeInsets.all(4),
          child: Text(
            title,
            style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

// Video Call Screen
class VideoCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Video Call Screen")),
    );
  }
}

// AI Bot Screen
class AiBotScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("AI Bot Screen")),
    );
  }
}

// History Screen
class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("History Screen")),
    );
  }
}

// Medical Report Screen
class MedicalReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Medical Report Screen")),
    );
  }
}
