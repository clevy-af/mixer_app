import 'package:flutter/material.dart';
import 'package:mixer_app/constants/colors.dart';
import 'package:mixer_app/constants/numeric.dart';

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
    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient:_selectedPlan==0?RadialGradient(
            center:Alignment(0.0, -1.5),
              radius: 1,
              focalRadius: 0.5,
              colors: [cMixerBackgroundGradient1,cMixerBackgroundGradient2,]
          ): LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

              stops:[0.1,.2],

              colors:[cMixerVIPBackgroundGradient1,cMixerVIPBackgroundGradient2]
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            centerTitle: false,
            title: Text(
              'Mixer',
              style: kManrope700.copyWith(fontSize: 24),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.close, color: Color(0xffB3B4B7)),
                onPressed:Navigator.of(context).pop,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Level Up Your Mixer Experience',
                      style: kManrope800.copyWith(color: _selectedPlan==0?cMixerText:cMixerVIPText),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Select a plan',
                      textAlign: TextAlign.left,
                      style: kManrope500,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedPlan = 0;
                              });
                            },
                            child: PlanCard(
                              index: 0,
                              selected: _selectedPlan==0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedPlan = 1;
                              });
                            },
                            child: PlanCard(
                              index: 1,
                              selected: _selectedPlan==1,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    _buildVipFeaturesCard(_selectedPlan),
                  ],
                ),

                Column(mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildContinueButton(),
                    const SizedBox(height: 20),

                    Text(
                      'By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer\'s Terms.',
                      textAlign: TextAlign.center,
                      style:kManrope500.copyWith(fontSize: 10, color: cArrowForward),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVipFeaturesCard(int selected) {
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
        // color:,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: selected==0?cMixerSelectedBorder:cMixerVIPSelectedBorder)
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...vipFeatures.map((feature) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(Icons.check, color:selected==0? cMixerText:cMixerVIPText),
                      const SizedBox(width: 12),
                      Text(
                        feature,
                        style:kManrope500,
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
           Positioned(
             top: -kMinInteractiveDimension,
             child: Chip(
               visualDensity:  VisualDensity(),
               backgroundColor:selected==0?cMixerSelectedBg:cMixerVIPSelectedBg,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              side: BorderSide(color:selected==0?cMixerSelectedBorder:cMixerVIPSelectedBorder ),
              label: Text(
                'Included with Mixer VIP',
                style: kManrope600.copyWith(fontSize: 12),
              ),
                       ),
           ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 11),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(39),
        gradient: LinearGradient(
           begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            stops: [
              0.05,0.97
            ],
            colors: _selectedPlan==0?[cMixerGradient1,cMixerGradient2]
            :[cMixerVIPGradient1,cMixerVIPGradient2]
        )
      ),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/heart-black.png',height: 25,width: 25,color: Colors.white,),
            const SizedBox(width: 8),
            Text(
              'Continue - \$${_selectedPlan == 0 ? '24.99' : '99.99'} total',
              style: kManrope600.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanCard extends StatelessWidget {
  const PlanCard({
    super.key, required this.index, required this.selected,
  });
  final int index;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color:selected? index==0 ? cMixerSelectedBg:cMixerVIPSelectedBg: null,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:selected? index==0 ? cMixerSelectedBorder:cMixerVIPSelectedBorder: cMixerBorder,
          width: 2,
        ),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    index==0?'Mixer':'Mixer VIP',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'SF Pro',
                      color: cTextBlack,
                      fontVariations: [
                        FontVariation('wght', 510)
                      ]
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${index==0?24.99:99.99}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset('assets/images/${index==0?'heart_mixer':'heart_mixer_vip'}.png',height: 35,width: 35,),
            ],
          ),

          const SizedBox(height: 8),
          Flexible(
            child: Text(
              index==0?'All of the below':'Mixer + VIP seating, food, and beverages',
              style: kManrope500.copyWith(fontSize: 14, color: cGrey),
            ),
          ),
        ],
      ),
    );
  }
}