import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://cscsfebshdqwpyeyyxmh.supabase.co', // Replace with your Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNzY3NmZWJzaGRxd3B5ZXl5eG1oIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzI3MTY0MjMsImV4cCI6MjA0ODI5MjQyM30.BYQRz1x54DqqgSOExs-vnWloi2fVCkQHvre4G1nbtxY', // Replace with your Supabase anon key
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Profile',
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final SupabaseClient supabase = Supabase.instance.client;

  // Fetch the hospital data based on the email
  Future<void> fetchHospitalData() async {
    try {
      final email = emailController.text.trim();
      if (email.isEmpty) {
        throw Exception('Please enter an email ID.');
      }

      final response = await supabase
          .from('hospitals')
          .select()
          .eq('email', email)
          .maybeSingle();

      if (response != null) {
        setState(() {
          nameController.text = response['hospital_name'] ?? '';
          passwordController.text = response['password']?.toString() ?? '';
          phoneController.text = response['phone_no'] ?? '';
          addressController.text = response['address'] ?? '';
          pincodeController.text = response['pincode'] ?? '';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hospital data fetched successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No hospital data found for the provided email.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  // Update the hospital data based on the email
  Future<void> updateHospitalData() async {
    try {
      final email = emailController.text.trim();
      if (email.isEmpty) {
        throw Exception('Please enter an email ID.');
      }

      final response = await supabase.from('hospitals').update({
        'hospital_name': nameController.text,
        'password': passwordController.text,
        'phone_no': phoneController.text,
        'address': addressController.text,
        'pincode': pincodeController.text,
      }).eq('email', email);

      if (response.error == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Hospital data updated successfully!')),
        );
      } else {
        throw response.error!;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              buildTextFormField(label: 'Email ID', controller: emailController),
              const SizedBox(height: 16),
              buildTextFormField(label: 'Hospital Name', controller: nameController),
              const SizedBox(height: 16),
              buildTextFormField(label: 'Password', controller: passwordController),
              const SizedBox(height: 16),
              buildTextFormField(label: 'Contact No', controller: phoneController),
              const SizedBox(height: 16),
              buildTextFormField(label: 'PinCode', controller: pincodeController),
              const SizedBox(height: 16),
              buildTextFormField(label: 'Address', controller: addressController, maxLines: 3),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: fetchHospitalData, // Fetch hospital data
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Fetch',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: updateHospitalData, // Update hospital data
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            labelText: label,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
