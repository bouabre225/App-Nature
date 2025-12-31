import 'package:flutter/material.dart';

class DiscoverYourPlantPage extends StatelessWidget {
  const DiscoverYourPlantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Discover Your Plant',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Create a green town',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.more_horiz, color: Colors.black54),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search, color: Colors.black38),
                          SizedBox(width: 12),
                          Text(
                            'Find your plants',
                            style: TextStyle(color: Colors.black38, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Your Plants',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text('Edit', style: TextStyle(fontSize: 14, color: Colors.black45)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 110,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        children: [
                          _buildPlantCircle('🌿', 'Basil', Colors.green.shade100),
                          const SizedBox(width: 20),
                          _buildPlantCircle('🥕', 'Carrots', Colors.orange.shade100),
                          const SizedBox(width: 20),
                          _buildAddPlantCircle(),
                          const SizedBox(width: 20),
                          _buildPlantCircle('🥒', 'Gherkin', Colors.green.shade50),
                          const SizedBox(width: 20),
                          _buildPlantCircle('🍅', 'Tomatoes', Colors.red.shade100),
                          const SizedBox(width: 20),
                          _buildPlantCircle('🥬', 'Lettuce', Colors.green.shade200),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Incomplete varieties',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text('See All', style: TextStyle(fontSize: 14, color: Colors.black45)),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: [
                    _buildPlantCard('Ungarischer Knoblauch', 'https://images.unsplash.com/photo-1580797542431-007e995a3e60?w=400', 'Incomplete'),
                    const SizedBox(width: 12),
                    _buildPlantCard('Gaindorfer Winter', 'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400', 'Incomplete'),
                    const SizedBox(width: 12),
                    _buildPlantCard('Tomatoes', 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=400', 'Incomplete'),
                    const SizedBox(width: 12),
                    _buildPlantCard('Carrots', 'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=400', 'Incomplete'),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
      ),
    );
  }

  Widget _buildPlantCircle(String emoji, String name, Color bgColor) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: Center(child: Text(emoji, style: const TextStyle(fontSize: 32))),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  Widget _buildAddPlantCircle() {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.green.shade200, width: 2),
          ),
          child: Icon(Icons.add, color: Colors.green.shade600, size: 32),
        ),
        const SizedBox(height: 8),
        const Text('Zucchini', style: TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  Widget _buildPlantCard(String name, String imageUrl, String status) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              width: 160,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 160,
                  height: 140,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image, size: 50),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
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
                        Icon(Icons.check_circle_outline, size: 16, color: Colors.green.shade400),
                        const SizedBox(width: 4),
                        Text(status, style: TextStyle(fontSize: 12, color: Colors.green.shade600)),
                      ],
                    ),
                    Icon(Icons.arrow_forward, size: 16, color: Colors.black38),
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