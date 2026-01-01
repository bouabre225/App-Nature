import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 120), // Espace pour le menu flottant
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Barre de recherche de localisation
              TextField(
                decoration: InputDecoration(
                  hintText: "Search location...",
                  prefixIcon: const Icon(Icons.location_on_outlined, color: Colors.black54),
                  filled: true,
                  fillColor: const Color(0xFFF5F7F9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              const Text(
                "Today Weather",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Carte météo avec dégradé
              _buildWeatherCard(),

              const SizedBox(height: 30),
              const Text(
                "Diseases",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Liste des maladies avec tes images locales
              _diseaseTile("Angular", "Today 2:00 PM", "assets/diseases/leaf_spot.jpg"),
              _diseaseTile("Ascochyta", "Yesterday 4:30 PM", "assets/diseases/blight.jpg"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: const LinearGradient(
          colors: [Color(0xFFD4E9F9), Color(0xFFFFEB3B)], // Dégradé bleu clair vers jaune
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Monday", style: TextStyle(fontWeight: FontWeight.w500)),
              Text(
                "8:25 am",
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "24°C",
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 30),
          // Bouton "Determine Location"
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Text(
              "Determine Location Automatically",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Widget _diseaseTile(String name, String time, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          // Image de la maladie (chargée depuis tes assets)
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
          // Bouton flèche
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F5F7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.arrow_outward, size: 18, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}