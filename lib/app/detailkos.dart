import 'package:flutter/material.dart';

class Detailkos extends StatelessWidget {
  const Detailkos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kost Aisyah Nagoya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const KostDetailPage(),
    );
  }
}

class KostDetailPage extends StatelessWidget {
  const KostDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kost Aisyah Nagoya'),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Tambahkan logika share di sini
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Header
            Image.asset(
              'assets/kos1.jpg', // Ganti URL placeholder dengan URL gambar sebenarnya
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Informasi Kost
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kost Aisyah Nagoya, Batam',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.location_on, size: 18, color: Colors.blue),
                      SizedBox(width: 4),
                      Text('Nagoya, Batam'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Rp 1.000.000 / Perbulan',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange, size: 18),
                      SizedBox(width: 4),
                      Text('4,5/5 (100 reviewers)'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('3 Kamar Tersedia'),
                ],
              ),
            ),

            // Fasilitas
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Fasilitas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FacilityItem(icon: Icons.tv, label: 'TV'),
                FacilityItem(icon: Icons.corporate_fare, label: 'Lemari'),
                FacilityItem(icon: Icons.bed, label: 'Tempat Tidur'),
                FacilityItem(icon: Icons.ac_unit, label: 'AC'),
              ],
            ),

            // Kebijakan Properti
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Kebijakan Properti',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const PolicyItem(
              text:
                  'Seluruh fasilitas kost, hanya diperuntukkan bagi Penyewa kost/penyewa kamar, bukan untuk umum.',
            ),
            const PolicyItem(
              text:
                  'Penyewa kost dilarang menerima tamu dan/atau membawa teman ke kamar kost.',
            ),
            const PolicyItem(
              text:
                  'Penyewa kost tidak diperkenankan merokok di dalam kamar maupun di lingkungan rumah kost.',
            ),

            // Deskripsi Properti
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Deskripsi Properti',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Luas Kamar 6x4m lengkap dengan kamar mandi di dalam, terdapat halaman, area parkir yang luas, lingkungan yang nyaman dan CCTV 24 jam.',
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Pesan Kost
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk pesan kost
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 12.0),
                ),
                child: const Text(
                  'Pesan Kost',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class FacilityItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const FacilityItem({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        const SizedBox(height: 8),
        Text(label),
      ],
    );
  }
}

class PolicyItem extends StatelessWidget {
  final String text;

  const PolicyItem({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.black54),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
