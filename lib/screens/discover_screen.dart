import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 120),
          children: [
            _header(),
            const SizedBox(height: 25),
            _searchBar(),
            const SizedBox(height: 30),
            _sectionLabel("Your Plants", "Edit"),
            _categoriesList(),
            const SizedBox(height: 30),
            _sectionLabel("Incomplete varieties", "See All"),
            _varietiesGrid(),
          ],
        ),
      ),
    );
  }

  Widget _header() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Discover Your Plant", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        Text("Create a green town", style: TextStyle(color: Colors.grey)),
      ]),
      const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.more_horiz, color: Colors.black)),
    ],
  );

  Widget _searchBar() => TextField(
    decoration: InputDecoration(
      hintText: "Find your plants",
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
    ),
  );

  Widget _sectionLabel(String t, String a) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 15),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      Text(a, style: const TextStyle(color: Colors.grey)),
    ]),
  );

  Widget _categoriesList() {
    final plants = [
      {"name": "Basil", "path": "assets/categories/basil.jpg"},
      {"name": "Carrots", "path": "assets/categories/carrots.jpg"},
      {"name": "Zucchini", "path": "assets/categories/zucchini.jpg"},
      {"name": "Gherkin", "path": "assets/categories/gherkin.jpg"},
    ];
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: plants.length,
        itemBuilder: (context, i) => Container(
          width: 90, margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(45)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(radius: 28, backgroundImage: AssetImage(plants[i]["path"]!)),
            const SizedBox(height: 10),
            Text(plants[i]["name"]!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ]),
        ),
      ),
    );
  }

  Widget _varietiesGrid() {
    final vars = [
      {"name": "Ungarischer Knoblauch", "path": "assets/varieties/garlic.jpg"},
      {"name": "Gaindorfer Winter", "path": "assets/varieties/lettuce.jpg"},
      {"name": "Tomatoes", "path": "assets/varieties/tomatoes.jpg"},
      {"name": "Bell Pepper", "path": "assets/varieties/bell_pepper.jpg"},
    ];
    return GridView.builder(
      shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 0.75),
      itemCount: vars.length,
      itemBuilder: (context, i) => _card(vars[i]["name"]!, vars[i]["path"]!),
    );
  }

  Widget _card(String name, String path) => Container(
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
    child: Column(children: [
      Expanded(child: Container(margin: const EdgeInsets.all(8), decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover)))),
      Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 1),
        const SizedBox(height: 8),
        const Row(children: [Icon(Icons.pie_chart, size: 14, color: Color(0xFF007D40)), SizedBox(width: 4), Text("Incomplete", style: TextStyle(fontSize: 11, color: Colors.grey)), Spacer(), Icon(Icons.arrow_outward, size: 16)]),
      ])),
    ]),
  );
}