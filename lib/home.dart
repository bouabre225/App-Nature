import 'package:flutter/material.dart';

class DiscoverYourPlantPage extends StatelessWidget {
  const DiscoverYourPlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Discover Your Plant",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Create a green town",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Icon(Icons.more_horiz, color: Colors.black38),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.black38),
                          SizedBox(width: 12),
                          Text(
                            "Find your plants",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                            ),
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
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Your Plants",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "Edit",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    SizedBox(
                      height: 110,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          //A COMPLETER
                          _PlantCircle('/basil.jpg', 'Basil', Colors.green.shade100),
                          const SizedBox(width: 20),
                          _PlantCircle('/carotte.jpg', 'Carrots', Colors.orange.shade100),
                          const SizedBox(width: 20),
                          const SizedBox(width: 20),
                          _PlantCircle('/gherkin.jpg', 'Gherkin', Colors.green.shade50),
                          const SizedBox(width: 20),
                          _PlantCircle('/zuccichi.jpg', 'zuccichi', Colors.green.shade200),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Incomplete varieties",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(fontSize: 14, color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                delegate: SliverChildListDelegate(
                  [
                    _PlantCard(
                      'Ungarischer Knoblauch',
                      '/ail.jpg',
                    ),
                    _PlantCard(
                      'Gaindorfer Winter',
                      '/laitue.jpg',
                    ),
                    _PlantCard(
                      'Tomatoes',
                      '/tomates.jpg',
                    ),
                    _PlantCard(
                      'Poivron',
                      '/poivron.jpg',
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
      ),
    );
  }

  Widget _PlantCircle(String imgPath, String name, Color bgColor) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 50,
          decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Image.asset(
              imgPath,
              fit: BoxFit.contain,
            ),
          )
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  Widget _PlantCard(String Name, String imgUrl) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imgUrl,
              width: 200,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 110,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image, size: 50),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Name,
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
                        Icon(
                          Icons.check_circle_outline,
                          size: 16,
                          color: Colors.green.shade400,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "Incomplete",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green.shade600,
                          ),
                        ),
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
