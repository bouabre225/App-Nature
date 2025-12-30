import 'package:flutter/material.dart';
import '../utils/image_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: ImageHelper.buildNetworkImage(
                      ImageHelper.backgroundGarden,
                      fit: BoxFit.cover,
                      placeholder: Container(
                        color: Colors.green[300],
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              ),

              Transform.translate(
                offset: const Offset(0, -50),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: ClipOval(
                        child: ImageHelper.buildNetworkImage(
                          ImageHelper.wolfgang,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person, size: 50, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Wolfgang palme',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.amber[600], size: 20),
                        Icon(Icons.star, color: Colors.amber[600], size: 20),
                        Icon(Icons.star, color: Colors.amber[600], size: 20),
                        Icon(Icons.star, color: Colors.amber[600], size: 20),
                        Icon(Icons.star, color: Colors.amber[600], size: 20),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        'A farmer cultivates crops and raises livestock, providing essential food while ensuring sustainable agriculture.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.person_add_outlined, size: 18, color: Colors.grey[700]),
                            const SizedBox(width: 6),
                            const Text(
                              '632 Follow',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Row(
                          children: [
                            Icon(Icons.people_outline, size: 18, color: Colors.grey[700]),
                            const SizedBox(width: 6),
                            const Text(
                              '632 Followers',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.all(16),
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
                        child: Row(
                          children: [
                            ClipOval(
                              child: ImageHelper.buildNetworkImage(
                                ImageHelper.tasha,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                                placeholder: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.grey[300],
                                  child: const Icon(Icons.person, color: Colors.white),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tasha Dominguez',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Agriculture Specialist',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[400]),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Winter vegetables',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '12 items',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: [
                          _buildVegetableCard('Carrots', 'Carrots are a...'),
                          _buildVegetableCard('Beetroot', 'The beetroot...'),
                          _buildVegetableCard('Peas', 'Peas a...'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVegetableCard(String title, String description) {
    String imageUrl = '';
    if (title == 'Carrots') {
      imageUrl = ImageHelper.carrots;
    } else if (title == 'Beetroot') {
      imageUrl = ImageHelper.beetroot;
    } else if (title == 'Peas') {
      imageUrl = ImageHelper.peas;
    }

    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 12),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: imageUrl.isNotEmpty
                ? ImageHelper.buildNetworkImage(
              imageUrl,
              height: 90,
              width: double.infinity,
              fit: BoxFit.cover,
            )
                : Container(
              height: 90,
              width: double.infinity,
              color: Colors.green[100],
              child: const Icon(Icons.image, size: 30, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_forward, size: 14, color: Colors.grey[600]),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[600],
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
