import 'package:flutter/material.dart';

class BlindMixerScreen extends StatefulWidget {
  const BlindMixerScreen({super.key});

  @override
  State<BlindMixerScreen> createState() => _BlindMixerScreenState();
}

class _BlindMixerScreenState extends State<BlindMixerScreen> {
  bool _isApplied = false;

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
        actions: const [
          Icon(Icons.flash_on, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Placeholder for the illustration image
              Image.asset(
                'assets/images/blind_date_illustration.png',
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
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

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
              ? const Icon(Icons.check, color: Color(0xFF5B1778))
              : const Icon(Icons.calendar_month, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            _isApplied ? 'Applied for Blind Mixer' : 'Fill out the Form',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _isApplied ? const Color(0xFF5B1778) : Colors.white,
            ),
          ),
        ],
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