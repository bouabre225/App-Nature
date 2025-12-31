import 'package:flutter/material.dart';
import '../utils/images_helper.dart';

class PlantsScreen extends StatelessWidget {
  const PlantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Discover Your Plant',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Create a green town',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    ),
                  ],
                ),
                
                const SizedBox(height: 20),
                
                // Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey[400], size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Find your plants',
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Your Plants Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Plants',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          color: Color(0xFF2D7D5E),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Plant Icons Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildPlantIcon(Icons.eco, 'Basil', Colors.green),
                    _buildPlantIcon(Icons.agriculture, 'Carrots', Colors.orange),
                    _buildPlantIcon(Icons.add, 'Zucchini', Colors.grey),
                    _buildPlantIcon(Icons.grass, 'Gherkin', Colors.green),
                  ],
                ),
                
                const SizedBox(height: 30),
                
                // Incomplete varieties section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Incomplete varieties',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Color(0xFF2D7D5E),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Grid of plant varieties
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.85,
                  children: [
                    _buildPlantCard('Ungarischer Knoblauch', 'Incomplete'),
                    _buildPlantCard('Gaindorfer Winter', 'Incomplete'),
                    _buildPlantCard('Tomatoes', 'Incomplete'),
                    _buildPlantCard('Carrots', 'Incomplete'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlantIcon(IconData icon, String label, Color color) {
    // Map plant names to images
    String? imageUrl;
    if (label == 'Basil') {
      imageUrl = ImageHelper.basil;
    } else if (label == 'Carrots') {
      imageUrl = ImageHelper.carrots;
    } else if (label == 'Zucchini') {
      imageUrl = ImageHelper.zucchini;
    } else if (label == 'Gherkin') {
      imageUrl = ImageHelper.gherkin;
    }
    
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: imageUrl != null
              ? ClipOval(
                  child: ImageHelper.buildNetworkImage(
                    imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    placeholder: Icon(icon, color: color, size: 30),
                  ),
                )
              : Icon(icon, color: color, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildPlantCard(String title, String status) {
    // Map plant variety names to images
    String? imageUrl;
    if (title == 'Ungarischer Knoblauch') {
      imageUrl = ImageHelper.garlic;
    } else if (title == 'Gaindorfer Winter') {
      imageUrl = ImageHelper.lettuce;
    } else if (title == 'Tomatoes') {
      imageUrl = ImageHelper.tomatoes;
    } else if (title == 'Carrots') {
      imageUrl = ImageHelper.carrots;
    }
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: imageUrl != null
                ? ImageHelper.buildNetworkImage(
                    imageUrl,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 120,
                    width: double.infinity,
                    color: Colors.green[100],
                    child: const Icon(Icons.image, size: 40, color: Colors.grey),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
