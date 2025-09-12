import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.visibility_outlined, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileImageGrid(),
              const SizedBox(height: 32),
              const Text(
                'Your details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildDetailsList(),
              const SizedBox(height: 32),
              _buildQuizCard(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImageGrid() {
    // Placeholder for profile images. Use a List of Image.asset.
    final List<String> profileImages = [
      'assets/images/profile1.jpg',
      'assets/images/profile2.jpg',
      'assets/images/profile3.jpg',
      'assets/images/profile4.jpg',
      'assets/images/profile5.jpg',
      'assets/images/profile6.jpg',
    ];

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                profileImages[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            if (index == 0)
              const Positioned(
                bottom: 8,
                left: 8,
                child: Text(
                  'Main',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.cancel,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDetailsList() {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.person_outline, 'text': 'About me (Bio)'},
      {'icon': Icons.question_answer_outlined, 'text': 'What are you looking for?'},
      {'icon': Icons.female_outlined, 'text': 'Gender'},
      {'icon': Icons.cake_outlined, 'text': 'Birthday (Age)'},
      {'icon': Icons.height_outlined, 'text': 'Height'},
      {'icon': Icons.favorite_outline, 'text': 'Interested in?'},
      {'icon': Icons.wc_outlined, 'text': 'Sexuality'},
      {'icon': Icons.people_outline, 'text': 'Relationship'},
      {'icon': Icons.language_outlined, 'text': 'Ethnicity'},
      {'icon': Icons.child_friendly_outlined, 'text': 'Kids'},
      {'icon': Icons.wine_bar_outlined, 'text': 'Drinking'},
      {'icon': Icons.smoking_rooms_outlined, 'text': 'Smoking'},
      {'icon': Icons.grass_outlined, 'text': 'Marijuana'},
      {'icon': Icons.church_outlined, 'text': 'Religious Beliefs'},
      {'icon': Icons.gavel_outlined, 'text': 'Political Views'},
      {'icon': Icons.star_border, 'text': 'Interest and Hobbies'},
      {'icon': Icons.diamond_outlined, 'text': 'Values & Lifestyle'},
    ];

    return Column(
      children: items.map((item) {
        return _buildListTile(item['icon'], item['text']);
      }).toList(),
    );
  }

  Widget _buildListTile(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildQuizCard() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F2F9),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Discover your Perfect Match',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Placeholder for the group of people image
          Image.asset(
            'assets/images/quiz_people.png',
            height: 60,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF5B1778),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            onPressed: () {},
            child: const Text(
              'Take the quiz again',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}