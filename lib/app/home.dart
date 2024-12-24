import 'package:flutter/material.dart';
import 'package:koskosan/app/login.dart';
import 'package:koskosan/app/riwayat.dart';
import 'package:koskosan/app/detailkos.dart'; // Import DetailKos class

class KostPage extends StatelessWidget {
  const KostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('assets/profil.jpg'),
              radius: 20,
            ),
            SizedBox(width: 10),
            Text(
              'Hi, Nik Faridz',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari kost anda',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFF1F3F6),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategory(Icons.attach_money, 'Termurah'),
                  _buildCategory(Icons.calendar_today, 'Tahunan'),
                  _buildCategory(Icons.date_range, 'Bulanan'),
                  _buildCategory(Icons.clean_hands, 'Terbersih'),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Riwayat Pemesanan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildBookingHistory(
                  context), // Pass context to _buildBookingHistory
              const SizedBox(height: 30),
              const Text(
                'Rekomendasi Terbaik',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              _buildRecommendationList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(context),
    );
  }

  Widget _buildCategory(IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 5),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildBookingHistory(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Navigate to the DetailKos screen when tapped
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Detailkos()),
          );
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/kos1.jpg',
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          title: const Text('Kost Aisyah Batam',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text(
              '22 Januari 2024 - 1 Desember 2024\nBatam, Kepulauan Riau'),
        ),
      ),
    );
  }

  Widget _buildRecommendationList() {
    return Row(
      children: [
        Expanded(
          child: _buildKostCard(
            'Kost dekat dengan Univ Ibn...',
            'assets/kos2.jpg',
            'Batam',
            4.2,
            1000000,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildKostCard(
            'Kost dekat dengan u...',
            'assets/kos3.jpeg',
            'Batam',
            9.5,
            1000000,
          ),
        ),
      ],
    );
  }

  Widget _buildKostCard(
      String title, String image, String location, double rating, int price) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.blue),
                    Text(location),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(rating.toString()),
                  ],
                ),
                const SizedBox(height: 5),
                Text('Rp $price /Perbulan',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RiwayatPemesanan()),
          );
        } else if (index == 2) {
          // Navigasi ke halaman LoginPage saat tombol LogOut ditekan
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(), // Hilangkan const di sini
            ),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'LogOut'),
      ],
    );
  }
}
