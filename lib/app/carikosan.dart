import 'package:flutter/material.dart';

class KostCari extends StatelessWidget {
  const KostCari({super.key});

  final List<KostItem> kostItems = const [
    KostItem(
        name: "Kost Bapak, Batam",
        location: "Nagoya, Batam",
        rating: 4.5,
        reviewers: 100,
        price: 1000000,
        imageUrl: "assets/kos1.jpg"),
    KostItem(
        name: "Kost Bunga, Batam",
        location: "Batu Ampar, Batam",
        rating: 4.2,
        reviewers: 5,
        price: 500000,
        imageUrl: "assets/kos2.jpg"),
    KostItem(
        name: "Bambang Kost, Batam",
        location: "Bengkong, Batam",
        rating: 4.2,
        reviewers: 5,
        price: 800000,
        imageUrl: "assets/kos3.jpeg"),
    KostItem(
        name: "Kost Putra Batam",
        location: "Bengkong, Batam",
        rating: 4.2,
        reviewers: 5,
        price: 1200000,
        imageUrl: "assets/kos4.jpg"),
    KostItem(
        name: "Kost Alfa, Batam",
        location: "Nagoya, Batam",
        rating: 4.1,
        reviewers: 5,
        price: 900000,
        imageUrl: "assets/kos5.jpeg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cari Kost"),
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search bar and filter buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Cari kost anda",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    FilterButton(label: "Rekomendasi", isSelected: true),
                    FilterButton(label: "Termurah"),
                    FilterButton(label: "Termahal"),
                    FilterButton(label: "Terbersih"),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // List of Kosts
          Expanded(
            child: ListView.builder(
              itemCount: kostItems.length,
              itemBuilder: (context, index) {
                return KostCard(item: kostItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  const FilterButton({Key? key, required this.label, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class KostCard extends StatelessWidget {
  final KostItem item;

  const KostCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kost Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            child: Image.asset(
              item.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          // Kost Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.location,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text("${item.rating}/5 (${item.reviewers} reviewers)"),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Rp ${item.price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (Match m) => '${m[1]}.')} /Perbulan",
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KostItem {
  final String name;
  final String location;
  final double rating;
  final int reviewers;
  final int price;
  final String imageUrl;

  const KostItem({
    required this.name,
    required this.location,
    required this.rating,
    required this.reviewers,
    required this.price,
    required this.imageUrl,
  });
}
