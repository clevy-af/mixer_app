import 'package:flutter/material.dart';

class HomepageSeenEveryoneScreen extends StatelessWidget {
  const HomepageSeenEveryoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mixer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: const [
          Icon(Icons.flash_on, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildFilterButtons(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Placeholder for the illustration with people
                  Image.asset(
                    'assets/images/seen_everyone_illustration.png',
                    height: 120,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'You\'ve seen everyone nearby',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'No more profiles in your area. Check back later or expand your location to see more people.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF5B1778),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Adjust Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterChip('Filters', Icons.filter_list_outlined),
          const SizedBox(width: 8),
          _buildFilterChip('Age', Icons.keyboard_arrow_down_outlined),
          const SizedBox(width: 8),
          _buildFilterChip('Height', Icons.keyboard_arrow_down_outlined),
          const SizedBox(width: 8),
          _buildFilterChip('Habits', Icons.keyboard_arrow_down_outlined),
          const SizedBox(width: 8),
          _buildFilterChip('Lifestyle', Icons.keyboard_arrow_down_outlined),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, IconData icon) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(
            color: label == 'Filters' ? Colors.white : Colors.black),
      ),
      avatar: Icon(
        icon,
        color: label == 'Filters' ? Colors.white : Colors.black,
      ),
      backgroundColor: label == 'Filters' ? const Color(0xFF5B1778) : Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide.none,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF5B1778),
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.access_time),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.remove_red_eye_outlined),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: '',
        ),
      ],
    );
  }
}