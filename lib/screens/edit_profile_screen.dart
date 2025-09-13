import 'package:flutter/material.dart';
import 'package:mixer_app/constants/colors.dart';
import 'package:mixer_app/constants/numeric.dart';
import 'package:svg_flutter/svg.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});
  static String routeName='/edit-profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: cArrowBack),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              fontWeight: FontWeight.w600,
            fontFamily: 'Manrope',
            fontSize: 16,
              fontVariations: [
                FontVariation('wght', 600),
              ]
          ),
        ),
        centerTitle: true,
        actions:  [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child:  SvgPicture.asset('assets/svg/navbar3.svg',
              colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
            )
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height-kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              _buildProfileImageGrid(),
              const Text(
                'Your details',
                style: TextStyle(fontSize: 18,
                    fontWeight:FontWeight.bold,fontFamily: 'Manrope',
                  fontVariations: [
                    FontVariation('wght', 700),
                  ]
                ),
              ),
              ..._buildDetailsList(),
              // ListView(
              //   shrinkWrap: true,
              //   physics: NeverScrollableScrollPhysics(),
              //   children: ,
              // ),
              const SizedBox(height: 36),
              Container(
                // height: 209,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: cBackground,
                  border: Border.all(color: cButtonBorderDark),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(17),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Discover your Perfect Match',
                      style: kManrope700,
                    ),
                    // Placeholder for the group of people image
                    AvatarStack(size:  46.63),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: cPurple,
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Take the quiz again',
                        style: kManrope600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 44),

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
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
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
               Positioned(
                top: 4,
                left: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                  child: Text('Main',style: TextStyle(fontSize: 10),),
                ),
              ),
            const Positioned(
              top: -5,
              right: -5,
              child: CircleAvatar(
                backgroundColor: cGrey,
                radius: 10,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 11,
                  // size: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildDetailsList() {
    final List<Map<String, dynamic>> items = [
      {
        'icon':  SvgPicture.asset('assets/svg/user.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
        'text': 'About me (Bio)'
      },
      {
        'icon':  SvgPicture.asset('assets/svg/heart-search.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
        'text': 'What are you looking for?',
      },
      {'icon': SvgPicture.asset('assets/svg/gender.svg',
      colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Gender'},
      {'icon': SvgPicture.asset('assets/svg/setting.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Birthday (Age)'},
      {'icon': SvgPicture.asset('assets/svg/height.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Height'},
      {'icon': SvgPicture.asset('assets/svg/like.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Interested in?'},
      {'icon':SvgPicture.asset('assets/svg/gender.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Sexuality'},
      {'icon': SvgPicture.asset('assets/svg/relation.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Relationship'},
      {'icon': SvgPicture.asset('assets/svg/ethnicity.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Ethnicity'},
      {'icon': SvgPicture.asset('assets/svg/kids.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Kids'},
      {'icon':SvgPicture.asset('assets/svg/drinking.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Drinking'},
      {'icon':SvgPicture.asset('assets/svg/smoking.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Smoking'},
      {'icon': SvgPicture.asset('assets/svg/weed.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Marijuana'},
      {'icon':SvgPicture.asset('assets/svg/religion.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Religious Beliefs'},
      {'icon':SvgPicture.asset('assets/svg/party.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Political Views'},
      {'icon':SvgPicture.asset('assets/svg/star.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Interest and Hobbies'},
      {'icon': SvgPicture.asset('assets/svg/lifestyle.svg',
        colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ), 'text': 'Values & Lifestyle'},
    ];

    return  items.map((item) {
        return _buildListTile(item['icon'], item['text']);
      }).toList();
  }

  Widget _buildListTile(Widget icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color:cDivider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
         icon,
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Manrope',
                  fontSize: 16,
                  fontVariations: [
                    FontVariation('wght', 500),
                  ]
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color:cArrowForward),
        ],
      ),
    );
  }
}

class AvatarStack extends StatelessWidget {
  const AvatarStack({
    super.key,
    required this.size, this.isGrayScale=false,
  });

  final double size;
  final bool isGrayScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      height: size,
      width: size*2.3,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children:[
          Positioned(
            left:0,
            child: Container(
              height: size-7.8,
              width: size-7.8,
              // padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFFC5CA),
                  border: Border.all(
                      width:1.46,
                      color: cTextWhite
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/stack1.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Positioned(
            right:0,
            child:  Container(
              height:size-7.8,
              width:size-7.8,
              // padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Color(0xffFFDAA3),
                  shape: BoxShape.circle,
                  border: Border.all(
                      width:1.46,
                      color: cTextWhite
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/stack3.png'),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Positioned(
            left:size*0.69,
            child:  Container(
              height:size,
              width:size,
              // padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: Color(0xffF6E5F4),
                  shape: BoxShape.circle,
                  border: Border.all(
                      width:1.46,
                      color: cTextWhite
                  ),
                  image: DecorationImage(
                      image: AssetImage('assets/images/stack2${isGrayScale?'':'_plain'}.png'),
                      fit: BoxFit.cover,
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
