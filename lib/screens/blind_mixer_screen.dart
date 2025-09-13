import 'package:flutter/material.dart';
import 'package:mixer_app/components/svg_icon.dart';
import 'package:mixer_app/constants/colors.dart';
import 'package:mixer_app/constants/numeric.dart';
import 'package:mixer_app/screens/edit_profile_screen.dart';
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
      backgroundColor: Colors.white.withValues(alpha: 1),
      appBar: AppBar(
        title:  Text(
          'Mixer',
          style:kOnest,
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity(horizontal: -2),
            icon:SvgIcon(
              name: 'flash-circle',
              color: cPurple,
            ),
            onPressed: () {
          },),
          IconButton(
            visualDensity: VisualDensity(horizontal: -2),
            padding: EdgeInsets.zero,
            icon:SvgIcon(
              name: 'notification',
            color: cPurple,
          ), onPressed: () {  },
          ),

        ],
      ),
      body: [
        BlindDatePage(),
        Container(),
        Container(),
        Padding(
          padding: const EdgeInsets.all(24),
          child: ExplorePage(),
        ),
        Container(),
      ][currentPage],
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 5),
        padding: EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffF0F0F0),
              offset: Offset(0, -5), // X-axis offset 0, Y-axis offset -5 (moves shadow upwards)
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (index) =>   IconButton(
            style: IconButton.styleFrom(
              backgroundColor:  currentPage==index?cPurpleTint:null,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
            ),
            onPressed:() => onPressedNavigation(index),
            icon:index==1?Image.asset('assets/images/heart-black.png',height: 25,): SvgPicture.asset('assets/svg/navbar$index.svg',
              colorFilter: ColorFilter.mode(currentPage==index?cPurple:Colors.black, BlendMode.srcIn),),
          ),
          ),
        ),
      ),
    );
  }


  void onPressedNavigation(index) {
    if([0,3].contains(index)) {
      setState(() {
      currentPage=index;
    });

    }
    else
      if (index==1) {
        Navigator.pushNamed(context, SubscriptionScreen.routeName);
      }
      else  if (index==4) {
        Navigator.pushNamed(context, EditProfileScreen.routeName);
      }
  }
}

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}
class _ExplorePageState extends State<ExplorePage> {
  bool _isApplied = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Placeholder for the illustration image
        Image.asset(
          'assets/images/home_graphic.png',
          width: MediaQuery.of(context).size.width*0.5,
        ),
        const SizedBox(height: 20),
        Divider(),
        const SizedBox(height: 12),
        Text(
          'Upcoming Blind Date',
          style: kManrope800,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
         Text(
          'Let Mixer surprise you with a match.',
          style:kManrope500.copyWith(fontVariations: [FontVariation('wght', 400)]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
         Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xffFFFDFD),
            border: Border.all(color: cDivider),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgIcon(name: 'calendar',color: cPurple,),
              SizedBox(width: 8),
              Text(
                'September 28 - 10 PM',
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),

            ],
          ),
        ),
        const SizedBox(height: 12),

        Divider(),

        const SizedBox(height: 50),


          AnimatedOpacity(
            duration: kThemeAnimationDuration,
            opacity: _isApplied?0:1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Sign Up • Smart Match • Blind Date',
                style: kManrope500.copyWith(color: cPurple),
              ),
            ),
          ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isApplied = !_isApplied;
                  });
                },
                child: Container(

                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    color: _isApplied ? Colors.white : const Color(0xFF5B1778),
                    borderRadius: BorderRadius.circular(39),
                    border: _isApplied
                        ? Border.all(color:cButtonBorderDark, width: 1.5)
                        : null,
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _isApplied
                          ? const Icon(Icons.check, color: cPurple)
                          : SvgIcon(name: 'form',color: cPurpleIcon,),
                      const SizedBox(width: 8),
                      Text(
                        _isApplied ? 'Applied for Blind Mixer' : 'Fill out the Form',
                        style: kManrope600.copyWith(color:    _isApplied?cPurple:Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          stops: [
            0.02,0.2,0.98
          ],
            colors: [Colors.white,cButtonBorder,Colors.white],
        )
      ),
    );
  }
}

class BlindDatePage extends StatefulWidget {
  const BlindDatePage({super.key});

  @override
  State<BlindDatePage> createState() => _BlindDatePageState();
}

class _BlindDatePageState extends State<BlindDatePage> {
  List<String> selected=[];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left:16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
            'Filters','Age','Height','Habits',
              ].map((e) {
                var color = selected.contains(e)? cPurple : cArrowForward;
                return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilterChip(
                  onSelected: (value) => setState(() {
                    if(value) {
                      selected.add(e);
                    } else {
                      selected.remove(e);
                    }
                  }),
                  selected: selected.contains(e),
                  showCheckmark: false,
                  padding: EdgeInsets.symmetric(horizontal: 9),
                  label: Row(
                    children: [
                      if(e == 'Filters')
                      SvgIcon(name: 'filter',color: color,),
                      if(e == 'Filters')
                        const SizedBox(width: 8),
                      Text(
                        e,
                        style: TextStyle(
                            color:color),
                      ),
                      if(e != 'Filters')
                        const SizedBox(width: 8),

                      if(e != 'Filters')
                        Icon(Icons.keyboard_arrow_down_outlined, color: color,)
                    ],
                  ),

                  backgroundColor: selected.contains(e) ? const Color(0xFF5B1778) : const Color(0xFFF8F8F8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side:BorderSide(color: Colors.transparent),
                  ),
                ),
              );
              },).toList(),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                AvatarStack(size: 96.77,isGrayScale: true,),
                const SizedBox(height: 32),
                Text(
                  selected.isNotEmpty?'You’ve seen them all':'You\'ve seen everyone nearby',
                  style:kManrope700,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  selected.isNotEmpty?'No more profiles match your filters. Update your preferences to find more people.':'No more profiles in your area. Check back later or expand your location to see more people.',
                  style: kManrope500,
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
                    visualDensity: VisualDensity(vertical: -1)
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

}
