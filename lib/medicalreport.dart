import 'package:flutter/material.dart';

void main() {
  runApp(MedicalApp());
}

class MedicalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MedicalScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MedicalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Medical Report',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column: Reports Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Your Reports',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  _buildReportBox(context, 'Blood Report', Icons.bloodtype),
                  SizedBox(height: 16),
                  _buildReportBox(context, 'X-ray Report', Icons.medical_services),
                  SizedBox(height: 16),
                  _buildReportBox(context, 'Eye Report', Icons.visibility),
                  SizedBox(height: 16),
                  _buildReportBox(context, 'CT Scan Report', Icons.visibility),
                  SizedBox(height: 16),
                  _buildReportBox(context, 'Sonography Report', Icons.visibility),
                  SizedBox(height: 16),
                  _buildReportBox(context, 'Thyroid Test', Icons.visibility),
                ],
              ),
            ),

            SizedBox(width: 16),

            // Right Column: Prescription Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Prescriptions',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  _buildPrescriptionBox(context, 'Prescription 1', Icons.note),
                  SizedBox(height: 16),
                  _buildPrescriptionBox(context, 'Prescription 2', Icons.note_alt),
                  SizedBox(height: 16),
                  _buildPrescriptionBox(context, 'Prescription 3', Icons.description),
                  SizedBox(height: 16),
                  _buildPrescriptionBox(context, 'Prescription 4', Icons.description),
                  SizedBox(height: 16),
                  _buildPrescriptionBox(context, 'Prescription 5', Icons.description),
                  SizedBox(height: 16),
                  _buildPrescriptionBox(context, 'Prescription 6', Icons.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create report boxes
  Widget _buildReportBox(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReportScreen(title: title),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(width: 20),
            Text(title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }


  Widget _buildPrescriptionBox(BuildContext context, String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PrescriptionScreen(title: title),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.green),
            SizedBox(width: 20),
            Text(title, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ReportScreen extends StatelessWidget {
  final String title;

  ReportScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _downloadReport(title);
          },
          child: Text('Download $title'),
        ),
      ),
    );
  }

  // Simulated download function for reports
  void _downloadReport(String title) {
    print('Simulated download of $title');
  }
}

class PrescriptionScreen extends StatelessWidget {
  final String title;

  PrescriptionScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _downloadPrescription(title);
          },
          child: Text('Download $title'),
        ),
      ),
    );
  }

  // Simulated download function for prescriptions
  void _downloadPrescription(String title) {
    print('Simulated download of $title');
  }
}
