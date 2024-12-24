import 'package:flutter/material.dart';
import 'package:koskosan/app/home.dart'; // Pastikan path file sesuai dengan struktur folder Anda
import 'package:koskosan/app/login.dart'; // Pastikan path file LoginPage sesuai

class RiwayatPemesanan extends StatelessWidget {
  const RiwayatPemesanan({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> pemesananList = [
      {
        'judul': 'Kost Aisyah Batam',
        'tanggal': '1 Jan 2022 - 1 Jan 2023',
        'lokasi': 'Batam, Kepulauan Riau',
        'status': 'Selesai',
        'image': 'assets/kos1.jpg',
      },
      {
        'judul': 'Kost Aisyah Batam',
        'tanggal': '2 Des 2021 - 2 Jan 2022',
        'lokasi': 'Batam, Kepulauan Riau',
        'status': 'Selesai',
        'image': 'assets/kos2.jpg',
      },
      {
        'judul': 'Kost Aisyah Batam',
        'tanggal': '30 Jun 2021 - 30 Jul 2021',
        'lokasi': 'Batam, Kepulauan Riau',
        'status': 'Selesai',
        'image': 'assets/kos3.jpeg',
      },
      {
        'judul': 'Kost Aisyah Batam',
        'tanggal': '28 May 2021 - 28 Jun 2021',
        'lokasi': 'Batam, Kepulauan Riau',
        'status': 'Selesai',
        'image': 'assets/kos4.jpg',
      },
      {
        'judul': 'Kost Aisyah Batam',
        'tanggal': '1 Januari 2021 - 1 Mar 2021',
        'lokasi': 'Batam, Kepulauan Riau',
        'status': 'Selesai',
        'image': 'assets/kos5.jpeg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pemesanan Kost'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const KostPage(),
              ),
              (route) => false,
            );
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: pemesananList.length,
        itemBuilder: (context, index) {
          final item = pemesananList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      item['image']!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['judul']!,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 14.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              item['tanggal']!,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 14.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              item['lokasi']!,
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              size: 14.0,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              item['status']!,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.green,
                              ),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Tulis Ulasan',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: _buildBottomNavigation(context),
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: 1, // Menandai "History" sebagai item yang dipilih
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'LogOut'),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => KostPage()),
            (route) => false,
          );
        } else if (index == 2) {
          // Navigasi ke halaman LoginPage saat tombol LogOut ditekan
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(), // Pindah ke halaman Login
            ),
          );
        }
      },
    );
  }
}
