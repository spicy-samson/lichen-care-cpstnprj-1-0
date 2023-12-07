import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LichenPediaArchive extends StatefulWidget {
  @override
  _LichenPediaArchiveState createState() => _LichenPediaArchiveState();
}

class _LichenPediaArchiveState extends State<LichenPediaArchive> {
  final int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double scaleFactor = h / 1080 * 0.9;
    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFF4E9),
        title: Padding(
          padding: EdgeInsets.only(top: h * 0.02, right: w * 0.42),
          child: SvgPicture.asset(
            'assets/svgs/#2 - lichenpedia.svg',
            width: w * 0.1,
            height: h * 0.6,
          ),
        ),
        elevation: 0,
        toolbarHeight: 80.0,
      ),

      // Body
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                'Research Archive',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'ABeeZee',
                    fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://www.aafp.org/pubs/afp/issues/2011/0701/p53.html',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Diagnosis and treatment of lichen planus.',
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'RP Usatine, M Tinitigan - American family physician.\n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                '... than 50 percent of women with oral lichen planus have undiagnosed vulvar lichen planus, widespread oral lichen planus and for lichen planus involving other mucocutaneous sites.',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://onlinelibrary.wiley.com/doi/abs/10.1111/j.1600-0714.2010.00946.x',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pathogenesis of oral lichen planus - a review',
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'M. R. Roopashree, Rajesh V Gondhalekar, M. C. Shashikanth, Jiji George, S. H. Thippeswamy, Abhilasha Shukla \n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Journal of Oral... The various hypothesis proposed for pathogenesis of oral lichen planus are discussed in defining lichen planus as a true autoimmune disease.',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://www.frontiersin.org/articles/10.3389/fmed.2021.737813/full',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lichen Planus',
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Boch K., Langan E., Kridin K., Zillikens D., Ludwig R., & Bieber K. 2021.\n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                '... lichen planus and its variations. Most of the previous statistical studies date back to the American Dermatologic Association symposium on lichen planus... patients with lichen planus.',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://onlinelibrary.wiley.com/doi/full/10.1111/ddg.14565',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lichen planus – a clinical guide',
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Solimani, F., Forchhammer, S., Schloegl, A., Ghoreschi, K. & Meier, K. 2021\n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Lichen planus (LP) is a chronic lichenoid inflammatory disorder of the skin, mucosa and of the appendages. LP is classically characterized by the presence of a ...',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://www.sciencedirect.com/science/article/abs/pii/S2387020617306277',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Treatment of oral lichen planus. Systematic review and therapeutic guide',
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'García-Pola, M. J., García-Pola, M. J.,  K. & Garcia-Martin, J. M. 2017\n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'In this systematic review, 55 structured articles on the therapeutic efficacy against pain and clinical signs of oral lichen planus (OLP) were analyzed. The literature search was developed according to the criteria of the PRISMA system ...',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://onlinelibrary.wiley.com/doi/abs/10.1111/jdv.15771',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Lichen planus: a comprehensive evidence-based analysis of medical treatment',
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'H. Husein-ElAhmed & U. Gieler, M. Steinhoff. 2019\n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Lichen planus (LP) is a chronic-relapsing inflammatory skin disease. Although many drugs have been used for the management of LP, some of them lack the backup by strong therapeutic evidence, while others are not suitable for some patients due to safety profile issues. ...',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://jamanetwork.com/journals/jamadermatology/article-abstract/2758222',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Global Prevalence and Incidence Estimates of Oral Lichen Planus: A Systematic Review and Meta-analysis",
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Changchang Li, MD; Xiaoqiong Tang, MD; Xiaoyan Zheng, MD; et alShuqi. 2020\n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'This study identified the global prevalence and incidence of OLP in terms of its spatial, temporal, and population distribution. The overall estimated pooled prevalence of OLP was 0.89% among the general population and 0.98% among clinical patients.',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://www.cochranelibrary.com/cdsr/doi/10.1002/14651858.CD001168.pub3/full',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Interventions for treating oral lichen planus: corticosteroid therapies",
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Lodi, G., Manfredi, M., Mercadante, V., Murphy, R.,  Carrozzo, M. 2020\n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'This study identified the global prevalence and incidence of OLP in terms of its spatial, temporal, and population distribution. The overall estimated pooled prevalence of OLP was 0.89% among the general population and 0.98% among clinical patients.',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  launchUrlString(
                    'https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5439688/',
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SVG on the left
                      SvgPicture.asset(
                        'assets/svgs/researchbook_icon.svg',
                        width: 130,
                        height: 90,
                      ),

                      // Text on the right with automatic wrapping
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, right: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bullous lichen planus – a review",
                                style: TextStyle(
                                  fontSize: 19 * scaleFactor,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Liakopoulou, A., & Rallis, E. 2017\n',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Bullous lichen planus is a rare variant of lichen planus. It is characterized by vesicles or bullae, which usually develop in the context of pre-existing LP lesions. It is often misdiagnosed...',
                                style: TextStyle(
                                  fontSize: 18 * scaleFactor,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                        horizontal: 20, vertical: 22 * scaleFactor),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xFFFF7F50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: const BorderSide(
                          color: Colors.white,
                          width: 2.0), // Add the white border here
                    ),
                  ),
                ),
                child: const Text(
                  'Go back',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),

      // Floating action button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _lichenCheckBtn(context),

      // Bottom navigation ba()
      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  Container _lichenCheckBtn(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Make the container a circle
        border: Border.all(
          color: const Color(0xFFFF7F50), // Set the border color
          width: 3.0, // Set the border width
        ),
      ),
      child: FloatingActionButton(
        child: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/lichenCheck');
          },
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/LichenCheck_icon.svg',
            width: 32, // Set the width to adjust the size of the icon
            height: 32, // Set the height to adjust the size of the icon
          ),
        ),
        backgroundColor: Color(0xFFFFF4E9),
        onPressed: () {},
      ),
    );
  }

  BottomNavigationBar _bottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF66D7D1),
      selectedItemColor: Colors.white,
      unselectedItemColor: Color.fromARGB(94, 0, 0, 0),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 30,
            color: Color(0xFFFF7F50),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/Lichenpedia_icon.svg',
            width: 32,
            height: 32,
          ),
          label: 'Lichenpedia',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add, size: 32),
          label: 'LichenCheck',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/LichenHub_icon.svg',
            width: 32,
            height: 32,
          ),
          label: 'LichenHub',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/svgs/bottomNavBar/UserProfile_icon.svg',
            width: 32,
            height: 32,
          ),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
        // Handle navigation to different pages based on the index
        switch (index) {
          case 0:
            Navigator.of(context)
                .pushNamed('/home'); // Navigate to the 'home' route
            break;
          case 1:
            // Navigator.of(context).pushNamed(
            //     '/lichenpedia'); // Navigate to the 'lichenpedia' route
            break;
          case 2:
            Navigator.of(context).pushNamed(
                '/lichencheck'); // Navigate to the 'lichencheck' route
            break;
          case 3:
            Navigator.of(context)
                .pushNamed('/lichenHub'); // Navigate to the 'lichenhub' route
            break;
          case 4:
            Navigator.of(context)
                .pushNamed('/profile'); // Navigate to the 'profile' route
            break;
        }
      },
    );
  }
}

Widget _buildTextWithDivider(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          bottom: 6,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      if (text != 'Variants of Lichen Planus')
        const Divider(
          color: Colors.black,
        ),
    ],
  );
}
