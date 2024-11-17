import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health App',
      initialRoute: '/',
      routes: {
        '/': (context) => HealthAppHome(),
        '/video-call': (context) => VideoCallPage(),
        '/ai-bot': (context) => AIPage(),
        '/history': (context) => HistoryPage(),
        '/medical-report': (context) => MedicalReportPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class HealthAppHome extends StatefulWidget {
  @override
  _HealthAppHomeState createState() => _HealthAppHomeState();
}

class _HealthAppHomeState extends State<HealthAppHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    VideoCallPage(),
    AIPage(),
    HistoryPage(),
    MedicalReportPage(),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.video_call), label: "Video Call"),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: "AI Bot"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: "Medical Report"),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> bannerImages = [
    'https://www.shutterstock.com/image-photo/doctor-utilizing-advanced-digital-tablet-600nw-2481904799.jpg', // Replace with real URLs
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuJJmUwGfwai4FVt25BlC8q3nQFNDVblY_SB1sDTqd9htMrOh1BYjCdotWRlFtZxr3I8Q&usqp=CAU',
    'https://www.shutterstock.com/image-vector/medicine-paramedics-ambulance-concept-emergency-260nw-1946292013.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Upper Section with Hello Message, User Icon, and Notification Bell
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.account_circle, color: Colors.black, size: 30),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Hello, Joy",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("No new notifications")),
                    );
                  },
                ),
              ],
            ),
          ),

          // Banner Section with Horizontal Scrolling
          SizedBox(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: bannerImages.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(right: 8),
                  child: Image.network(
                    bannerImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),

          // Services Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Services",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Add functionality for "See All"
                  },
                  child: Text("See All"),
                ),
              ],
            ),
          ),
          // Expanded Service Boxes
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEnhancedServiceCard("Beds Availability", "https://www.shutterstock.com/image-vector/hospital-ward-interior-patient-beds-260nw-2512612813.jpg"),
                _buildEnhancedServiceCard("OPD's Schemes", "https://static.vecteezy.com/system/resources/previews/032/050/259/non_2x/doctor-and-girl-patient-at-desk-in-hospital-office-clinic-visit-for-exam-meeting-with-physician-conversation-with-medic-about-diagnosis-results-vector.jpg"),
                _buildEnhancedServiceCard("X-Ray", "https://www.shutterstock.com/image-vector/xray-pictures-vector-set-medical-600w-2410269123.jpg"),
              ],
            ),
          ),

          // Buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildEnhancedActionButton(
                  label: "Book Appointment",
                  color: Colors.blue,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Book Appointment Page Coming Soon!")),
                    );
                  },
                ),
                SizedBox(width: 10),
                _buildEnhancedActionButton(
                  label: "Emergency Services",
                  color: Colors.red,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Emergency Services Page Coming Soon!")),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedServiceCard(String title, String imageUrl) {
    return Expanded(
      child: Column(
        children: [
          Card(
            elevation: 5,
            child: Container(
              height: 160, // Increased height for more visibility
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildEnhancedActionButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded edges for appeal
            ),
          ),
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 18)), // Larger button
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Pages for Navigation
class VideoCallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Video Call")),
      body: Center(child: Text("Video Call Page")),
    );
  }
}

class AIPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AI Bot")),
      body: Center(child: Text("AI Bot Page")),
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: Center(child: Text("History Page")),
    );
  }
}

class MedicalReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Medical Report")),
      body: Center(child: Text("Medical Report Page")),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("User Profile Page")),
    );
  }
}

