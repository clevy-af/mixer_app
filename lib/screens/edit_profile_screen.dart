import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

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
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child:  SvgPicture.asset('assets/svg/navbar3.svg',
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
            )
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
      'assets/images/profile1.png',
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
      {
        'icon':  SvgPicture.asset('assets/svg/user.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ),
        'text': 'About me (Bio)'
      },
      {
        'icon':  SvgPicture.asset('assets/svg/heart-search.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ),
        'text': 'What are you looking for?',
      },
      {'icon': SvgPicture.asset('assets/svg/gender.svg',
      colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Gender'},
      {'icon': SvgPicture.asset('assets/svg/setting.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Birthday (Age)'},
      {'icon': SvgPicture.asset('assets/svg/height.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Height'},
      {'icon': SvgPicture.asset('assets/svg/like.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Interested in?'},
      {'icon':SvgPicture.asset('assets/svg/gender.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Sexuality'},
      {'icon': SvgPicture.asset('assets/svg/relation.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Relationship'},
      {'icon': SvgPicture.asset('assets/svg/ethnicity.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Ethnicity'},
      {'icon': SvgPicture.asset('assets/svg/kids.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Kids'},
      {'icon':SvgPicture.asset('assets/svg/drinking.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Drinking'},
      {'icon':SvgPicture.asset('assets/svg/smoking.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Smoking'},
      {'icon': SvgPicture.asset('assets/svg/weed.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Marijuana'},
      {'icon':SvgPicture.asset('assets/svg/religion.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Religious Beliefs'},
      {'icon':SvgPicture.asset('assets/svg/party.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Political Views'},
      {'icon':SvgPicture.asset('assets/svg/star.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Interest and Hobbies'},
      {'icon': SvgPicture.asset('assets/svg/lifestyle.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),
      ), 'text': 'Values & Lifestyle'},
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
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children:[
                Positioned(
                  left:0,
                  child: Image.asset(
                    'assets/images/stack0.png',
                    height: 46.63,
                  ),
                ),
                Positioned(
                  right:0,
                  child: Image.asset(
                    'assets/images/stack0.png',
                    height: 46.63,
                  ),
                ),
                Positioned(
                  left:30.0,
                  bottom: 5,
                  child: Image.asset(
                    'assets/images/stack1.png',
                    height: 54.400001525878906,
                  ),
                ),
              ],
            ),
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