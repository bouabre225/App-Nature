import 'package:flutter/material.dart';

class DiscoverYourPlantPage extends StatelessWidget {
  const DiscoverYourPlantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            /// ================= HEADER =================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
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
                              ),
                            ),
                            SizedBox(height: 2),
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
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    /// Search
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
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

            /// ================= YOUR PLANTS =================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Your Plants',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Edit', style: TextStyle(color: Colors.black45)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Circles full width – no scroll
                    SizedBox(
                      height: 110,
                      width: double.infinity,
                      child: Row(
                        children: [
                          _plantExpanded('🌿', 'Basil', Colors.green.shade100),
                          _plantExpanded('🥕', 'Carrots', Colors.orange.shade100),
                          _plantExpanded('🥒', 'Gherkin', Colors.green.shade50),
                          _plantExpanded('🍅', 'Tomatoes', Colors.red.shade100),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// ================= INCOMPLETE VARIETIES =================
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Incomplete varieties',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('See All', style: TextStyle(color: Colors.black45)),
                  ],
                ),
              ),
            ),

            const SliverPadding(padding: EdgeInsets.only(top: 16)),

            /// Grid vertical (scroll handled by CustomScrollView)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                delegate: SliverChildListDelegate(
                  [
                    _buildPlantCard(
                      'Ungarischer Knoblauch',
                      'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400',
                      'Incomplete',
                    ),
                    _buildPlantCard(
                      'Gaindorfer Winter',
                      'https://images.unsplash.com/photo-1622206151226-18ca2c9ab4a1?w=400',
                      'Incomplete',
                    ),
                    _buildPlantCard(
                      'Tomatoes',
                      'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?w=400',
                      'Incomplete',
                    ),
                    _buildPlantCard(
                      'Carrots',
                      'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?w=400',
                      'Incomplete',
                    ),
                  ],
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
      ),
    );
  }

  /// ================= Widgets =================

  Widget _plantExpanded(String emoji, String name, Color bgColor) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: bgColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 32)),
            ),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPlantCard(String name, String imageUrl, String status) {
    return Container(
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
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
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
                        Icon(Icons.pie_chart, size: 16, color: Colors.green.shade400),
                        const SizedBox(width: 4),
                        Text(
                          status,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green.shade600,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward, size: 16, color: Colors.black38),
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
