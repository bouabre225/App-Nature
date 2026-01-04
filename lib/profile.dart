import 'package:flutter/material.dart';

class ProfileVegetablesPage extends StatelessWidget {
  const ProfileVegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    '/laitue.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.green.shade100);
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent, 
                          Colors.white.withOpacity(0.3), 
                          Colors.white
                        ],
                        stops: [0.0, 0.6, 1.0],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1), blurRadius: 10, 
                              offset: Offset(0, 5)
                            )
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            '/profil.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(color: Colors.grey.shade300, child: const Icon(Icons.person, size: 60, color: Colors.white));
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Wolfgang palme', 
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.black87
                    )
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5, (index) => Icon(
                        Icons.star, 
                        color: Colors.yellow.shade700, 
                        size: 20
                      )
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'A pioneer in winter vegetable cultivation at olivetia.com\nand raikes livestock, providing essential food\nwhile ensuring sustainable agriculture.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13, 
                      color: Colors.grey.shade600, 
                      height: 1.5
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.group, 
                        size: 18, 
                        color: Colors.grey.shade600
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '632 Follow', 
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.grey.shade700, 
                          fontWeight: FontWeight.w500
                        )
                      ),
                      const SizedBox(width: 20),
                      Icon(
                        Icons.people, 
                        size: 18, 
                        color: Colors.grey.shade600
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '632 Followers', 
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.grey.shade700, 
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, 
                            color: Colors.grey.shade200
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              '/mini.jpg',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.person, color: Colors.grey.shade400, size: 30);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Tasha Dominguez', 
                                style: TextStyle(
                                  fontSize: 16, 
                                  fontWeight: FontWeight.w600, 
                                  color: Colors.black87
                                )
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Agriculture Specialist', 
                                style: TextStyle(
                                  fontSize: 13, 
                                  color: Colors.grey.shade600
                                )
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Winter vegetables', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
                  Text('12 Items', style: TextStyle(fontSize: 14, color: Colors.black45)),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverGrid(
                delegate: SliverChildListDelegate(
                  [
                    _buildVegetableCard(
                      'Carrots', 
                      'Carrots are a...', 
                      '/carotte.jpg'
                    ),
                    _buildVegetableCard(
                      'Beetroot', 
                      'The beetroot...', 
                      '/breetroot.jpg'
                    ),
                    _buildVegetableCard(
                     'Peas', 
                     'Peas are...', 
                     '/poids.jpg'
                    ),
                    _buildVegetableCard(
                      'Lettuce', 
                      'Fresh lettuce...', 
                      '/laitue.jpg'
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
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }

   Widget _buildVegetableCard(String title, String subtitle, String imageUrl) {
    return Container(
      width: 120,
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
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            child: Image.asset(
              imageUrl,
              width: 200,
              height: 110,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 120,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image, size: 40),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}