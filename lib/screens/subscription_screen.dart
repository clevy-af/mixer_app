import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});
  static String routeName='/subscription';

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedPlan = 0; // 0 for Mixer, 1 for Mixer VIP

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
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Level Up Your Mixer Experience',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Select a plan',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: _buildPlanCard(
                      title: 'Mixer',
                      price: '24.99',
                      description: 'All of the below',
                      iconColor: const Color(0xFF5B1778),
                      isSelected: _selectedPlan == 0,
                      onTap: () {
                        setState(() {
                          _selectedPlan = 0;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildPlanCard(
                      title: 'Mixer VIP',
                      price: '99.99',
                      description: 'All 3 + VIP seating,\nfood, and beverages',
                      iconColor: const Color(0xFFDAA520),
                      isSelected: _selectedPlan == 1,
                      onTap: () {
                        setState(() {
                          _selectedPlan = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildVipFeaturesCard(),
              const SizedBox(height: 20),
              _buildContinueButton(),
              const SizedBox(height: 16),
              const Text(
                'By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer\'s Terms.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String description,
    required Color iconColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple[50] : Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF5B1778) : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Icon(Icons.favorite, color: iconColor),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '\$$price',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVipFeaturesCard() {
    final List<String> vipFeatures = [
      'Unlimited Likes',
      'See who liked you',
      'Find people with wide range',
      'Access to events',
      'VIP seating, food & beverages',
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Included with Mixer VIP',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...vipFeatures.map((feature) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  const Icon(Icons.check, color: Colors.green),
                  const SizedBox(width: 12),
                  Text(
                    feature,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    final buttonColor =
    _selectedPlan == 0 ? const Color(0xFF5B1778) : const Color(0xFFDAA520);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: buttonColor,
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 0,
      ),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.favorite, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            'Continue - \$${_selectedPlan == 0 ? '24.99' : '99.99'} total',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}