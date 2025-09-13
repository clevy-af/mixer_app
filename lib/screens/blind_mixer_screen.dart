import 'package:flutter/material.dart';
import 'package:mixer_app/constants/colors.dart';
import 'package:mixer_app/screens/subscription_screen.dart';
import 'package:svg_flutter/svg.dart';

class BlindMixerScreen extends StatefulWidget {
  const BlindMixerScreen({super.key});

  @override
  State<BlindMixerScreen> createState() => _BlindMixerScreenState();
}

class _BlindMixerScreenState extends State<BlindMixerScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Blind Mixer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(icon:SvgPicture.asset('assets/svg/flash-circle.svg'), color: Colors.black, onPressed: () {  },),
          const SizedBox(width: 16),
          IconButton(icon:SvgPicture.asset('assets/svg/notification.svg'), color: Colors.black, onPressed: () {  },),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child:[
            ExplorePage(),
            Container(),
            Container(),
            BlindDatePage(),
            Container(),
          ][currentPage],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: cPurple,
        unselectedItemColor: Colors.grey,
        onTap: (value) async {
          if([0,3].contains(value)) {
            currentPage=value;
          }
          else if(value==1){
            await Navigator.pushNamed(context, SubscriptionScreen.routeName);
          }
        },
        items: List.generate(5, (index) =>   BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/svg/navbar$index.svg',colorFilter: ColorFilter.mode(Colors.black, BlendMode.color),),
        ),
        ),
      ),
    );
  }

}

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  bool _isApplied = false;

  Widget _buildActionButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: _isApplied ? Colors.white : const Color(0xFF5B1778),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: _isApplied
              ? const BorderSide(color: Color(0xFF5B1778), width: 1.5)
              : BorderSide.none,
        ),
        elevation: 0,
      ),
      onPressed: () {
        setState(() {
          _isApplied = !_isApplied;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _isApplied
              ? const Icon(Icons.check, color: cPurple)
              : const Icon(Icons.calendar_month, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            _isApplied ? 'Applied for Blind Mixer' : 'Fill out the Form',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _isApplied ? cPurple : Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        // Placeholder for the illustration image
        Image.asset(
          'assets/images/home_graphic.png',
          height: 250,
        ),
        const SizedBox(height: 40),
        const Text(
          'Upcoming Blind Date',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        const Text(
          'Let Mixer surprise you with a match.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        _isApplied
            ? Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_today_outlined,
                  color: Colors.black54),
              SizedBox(width: 8),
              Text(
                'September 28 - 10 PM',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
            : const SizedBox(),
        const SizedBox(height: 50),
        _buildActionButton(),
        const SizedBox(height: 20),
        if (!_isApplied)
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Sign Up • Smart Match • Blind Date',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
      ],
    );
  }
}
class BlindDatePage extends StatelessWidget {
  const BlindDatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
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

}
