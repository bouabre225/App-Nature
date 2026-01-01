import 'package:flutter/material.dart';
import 'dart:math' as math; // Nécessaire pour la rotation des cartes

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBF9),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 150),
        child: Column(
          children: [
            _buildFanHeader(), // Les cartes en éventail + Avatar
            const SizedBox(height: 60),
            _buildProfileDetails(),
            const SizedBox(height: 30),
            _buildExpertTile(),
            const SizedBox(height: 30),
            _buildWinterSection(),
          ],
        ),
      ),
    );
  }

  // --- SECTION DU HAUT : L'ÉVENTAIL DE CARTES ---
  Widget _buildFanHeader() {
    return Container(
      height: 300,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          // Carte de gauche (Inclinée)
          _fanCard(angle: -0.2, offset: const Offset(-80, 20), image: "assets/varieties/lettuce.jpg"),
          // Carte de droite (Inclinée)
          _fanCard(angle: 0.2, offset: const Offset(80, 20), image: "assets/varieties/bell_pepper.jpg"),
          // Carte du centre (Droit)
          _fanCard(angle: 0, offset: const Offset(0, 0), image: "assets/varieties/tomatoes.jpg"),
          
          // Photo de profil de Wolfgang par-dessus
          Positioned(
            bottom: -40,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("assets/profile/wolfgang_portrait.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _fanCard({required double angle, required Offset offset, required String image}) {
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  // --- INFOS PROFIL ---
  Widget _buildProfileDetails() {
    return Column(
      children: [
        const Text("Wolfgang palme", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (i) => const Icon(Icons.star, color: Colors.orange, size: 22)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Text(
            "A farmer cultivates crops and raises livestock, providing essential food while ensuring sustainable agriculture.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, height: 1.5, fontSize: 14),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline, size: 20, color: Colors.black54),
            Text(" 632 Follow    ", style: TextStyle(fontWeight: FontWeight.w500)),
            Icon(Icons.people_outline, size: 20, color: Colors.black54),
            Text(" 632 Followers", style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ],
    );
  }

  // --- CARTE TASHA DOMINGUEZ ---
  Widget _buildExpertTile() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
      ),
      child: const ListTile(
        leading: CircleAvatar(backgroundImage: AssetImage("assets/profile/tasha_expert.jpg")),
        title: Text("Tasha Dominguez", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Agriculture Specialist"),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }

  // --- SECTION BASSE (CARTES AVEC TEXTES ET FLÈCHES) ---
  Widget _buildWinterSection() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Winter vegetables", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("12 items", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20),
            children: [
              _veggieCard("Carrots", "Carrots are a...", "assets/varieties/carrots.jpg"),
              _veggieCard("Beetroot", "The beetroot...", "assets/varieties/beetroot.jpg"),
              _veggieCard("Peas", "Peas are...", "assets/varieties/peas.jpg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _veggieCard(String title, String desc, String img) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.arrow_outward, size: 16, color: Colors.black87),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}