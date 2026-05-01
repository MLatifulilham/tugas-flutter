import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// ROOT APP
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(0xFFF5F6FA),
      ),
      home: ProfilePage(),
    );
  }
}

/// HALAMAN PROFIL
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Saya", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          Icon(Icons.settings, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 10),

            /// FOTO PROFIL + ANIMASI SCALE
            TweenAnimationBuilder(
              tween: Tween(begin: 0.8, end: 1.0),
              duration: Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/ilham.jpeg'),
              ),
            ),

            SizedBox(height: 10),

            /// NAMA & BIO
            Text(
              "M. Latiful Ilham",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Flutter Developer",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 20),

            /// INFO CARD
            InfoCard(icon: Icons.email, title: "Email", subtitle: "C030324025@poliban.ac.id"),
            InfoCard(icon: Icons.phone, title: "Telepon", subtitle: "+62-8125-0478-410"),
            InfoCard(icon: Icons.location_on, title: "Alamat", subtitle: "Banjarmasin, Indonesia"),
            InfoCard(icon: Icons.language, title: "Website", subtitle: "www.simpadu.id"),

            SizedBox(height: 20),

            /// EDIT PROFIL (DI ATAS LOGOUT)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditProfilePage()),
  );
},
                  icon: Icon(Icons.edit, color: Colors.black),
                  label: Text("Edit Profil", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: BorderSide(color: Colors.grey.shade300),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            /// LOGOUT (TEXT MERAH, BUKAN BACKGROUND)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.logout, color: Colors.red),
                  label: Text(
                    "Logout",
                    style: TextStyle(color: Colors.red),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

/// WIDGET INFO CARD
class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  InfoCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xFFEAF0FF),
            child: Icon(icon, color: Colors.blue),
          ),
          SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text(subtitle, style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}
class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final TextEditingController nameController =
      TextEditingController(text: "M. Latiful Ilham");

  final TextEditingController bioController =
      TextEditingController(text: "Flutter Developer");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            /// INPUT NAMA
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 15),

            /// INPUT BIO
            TextField(
              controller: bioController,
              decoration: InputDecoration(
                labelText: "Bio",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            /// TOMBOL SIMPAN
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // kembali ke profil
              },
              child: Text("Simpan"),
            )
          ],
        ),
      ),
    );
  }
}