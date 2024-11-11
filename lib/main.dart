import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        '/bedsAvailability': (context) => BedsAvailabilityPage(),
        '/opd': (context) => OpdPage(),
        '/labXRay': (context) => LabXRayPage(),
        '/bookAppointment': (context) => BookAppointmentPage(),
        '/emergencyServices': (context) => EmergencyServicesPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle, color: Colors.black, size: 30),
                SizedBox(width: 8),
                Text("Hey, Joy", style: TextStyle(color: Colors.black)),
              ],
            ),
            Icon(Icons.notifications, color: Colors.black, size: 30),
          ],
        ),
      ),
      body: Column(
        children: [
          // Scrolling Banner Section
          Container(
            height: 150.0,
            child: PageView(
              controller: _pageController,
              children: [
                BannerSlide(imagePath: 'assets/background.png', title: 'Welcome to our Clinic'),
                BannerSlide(imagePath: 'assets/ap_banner.jpg', title: 'Book Appointments Easily'),
                BannerSlide(imagePath: 'assets/Emergency.jpg', title: '24/7 Emergency Services'),
                BannerSlide(imagePath: 'assets/Xray.png', title: 'Advanced Lab & X-Ray'),
              ],
            ),
          ),
          // Services Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Our Services",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          // Grid for Service Cards
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              children: [
                ServiceCard(
                  title: "Beds Availability",
                  route: '/bedsAvailability',
                  imagePath: 'assets/Bed.jpg',
                ),
                ServiceCard(
                  title: "OPD",
                  route: '/opd',
                  imagePath: 'assets/Opd.png',
                ),
                ServiceCard(
                  title: "Lab X-Ray",
                  route: '/labXRay',
                  imagePath: 'assets/Xray.png',
                ),
                ServiceCard(
                  title: "Book Appointment",
                  route: '/bookAppointment',
                  imagePath: 'assets/ap_banner.jpg',
                ),
                ServiceCard(
                  title: "Emergency Services",
                  route: '/emergencyServices',
                  imagePath: 'assets/Emergency.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.access_time),
            label: 'History',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: 'AI ChatBot',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueAccent,
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Custom Banner Slide Widget
class BannerSlide extends StatelessWidget {
  final String imagePath;
  final String title;

  BannerSlide({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

// Custom Service Card Widget
class ServiceCard extends StatelessWidget {
  final String title;
  final String route;
  final String imagePath;

  ServiceCard({required this.title, required this.route, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Optional overlay for better text readability
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            // Centered title text
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example Pages for Navigation
class BedsAvailabilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beds Availability")),
      body: Center(child: Text("Beds Availability Page")),
    );
  }
}

class OpdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OPD")),
      body: Center(child: Text("OPD Page")),
    );
  }
}

class LabXRayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lab X-Ray")),
      body: Center(child: Text("Lab X-Ray Page")),
    );
  }
}

class BookAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Appointment")),
      body: Center(child: Text("Book Appointment Page")),
    );
  }
}

class EmergencyServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency Services")),
      body: Center(child: Text("Emergency Services Page")),
    );
  }
}
