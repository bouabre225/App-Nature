import 'package:flutter/material.dart';

class WeatherPlantPage extends StatelessWidget {
  const WeatherPlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.grey.shade200,
                  )
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search, 
                      color: Colors.grey.shade400,
                      size: 22,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Search your location...",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: 15
                        ),
                      )
                    ),
                    Icon(
                      Icons.tune,
                      color: Colors.grey.shade400,
                      size: 22,
                    )
                  ],
                ),
              ),
            ),
          ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Today Weather',
                      style: TextStyle(
                        fontSize: 20, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black87
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue.shade200, 
                            Colors.orange.shade100, 
                            Colors.yellow.shade200
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -20,
                            left: -30,
                            child: Container(
                              width: 120,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(60),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 20,
                            top: 40,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.yellow.shade400,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.yellow.shade300.withOpacity(0.5),
                                    blurRadius: 30,
                                    spreadRadius: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Monday', 
                                    style: TextStyle(
                                      fontSize: 16, 
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500
                                    )
                                  ),
                                  Text(
                                    '8:25 am', 
                                    style: TextStyle(
                                      fontSize: 14, 
                                      color: Colors.black54
                                    )
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '24°c', 
                                style: TextStyle(
                                  fontSize: 56, 
                                  fontWeight: FontWeight.bold, 
                                  color: Colors.black87, 
                                  height: 1.1
                                )
                              ),
                              const SizedBox(height: 60),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.location_on, 
                                      size: 18, 
                                      color: Colors.grey.shade600
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Determine Location Automatically', style: TextStyle(fontSize: 12, color: Colors.grey.shade700
                                    )
                                  ),
                                ],
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
          ),
           SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Diseases', 
                    style: TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.black87
                    )
                  ),
                  Text(
                    'See all', 
                    style: TextStyle(
                      fontSize: 14, 
                      color: Colors.black45
                    )
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                [
                  _buildDiseaseCard(
                    'Angular',
                    'Today 2:00 PM',
                    'Leaf spot of cucumber',
                    '/malade.jpg',
                  ),
                  _buildDiseaseCard(
                    'Ascochyta',
                    'Today 4:00 PM',
                    'Blight',
                    '/ascochyta.jpg',
                  ),
                  _buildDiseaseCard(
                    'Bacterial',
                    'Today 5:30 PM',
                    'Leaf blight',
                    '/bacterie.jpg',
                  ),
                  _buildDiseaseCard(
                    'Fungal',
                    'Tomorrow',
                    'Root rot',
                    '/fungal.jpg',
                  ),
                ],
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.82,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }

  Widget _buildDiseaseCard(String title, String time, String subtitle, String imageUrl) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05), 
            blurRadius: 10, 
            offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imageUrl,
              width: 200,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(width: 200, height: 100, color: Colors.grey.shade200, child: const Icon(Icons.image, size: 40));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time, 
                  style: TextStyle(
                    fontSize: 10, 
                    color: Colors.grey.shade500
                  )
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title, 
                        style: TextStyle(
                          fontSize: 14, 
                          fontWeight: FontWeight.w600, 
                          color: Colors.black87
                        ), 
                        maxLines: 1, 
                        overflow: TextOverflow.ellipsis
                      )
                    ),
                    Icon(
                      Icons.arrow_forward, 
                      size: 16, color: Colors.grey.shade400
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle, style: TextStyle(
                    fontSize: 11, color: Colors.grey.shade600
                  ), 
                  maxLines: 1, 
                  overflow: TextOverflow.ellipsis
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
