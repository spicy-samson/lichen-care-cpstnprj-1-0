import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class LichenPedia extends StatefulWidget {
  @override
  _LichenPediaState createState() => _LichenPediaState();
}

class _LichenPediaState extends State<LichenPedia> {
  final int _currentIndex = 1;
  bool isSwipedDown = false;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _photosPaddingKey = GlobalKey();

  void _onArrowDownPressed() {
    setState(() {
      isSwipedDown = !isSwipedDown;
    });

    if (isSwipedDown) {
      double offset = _getOffsetToPhotosSection();
      _scrollController.animateTo(offset,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  double _getOffsetToPhotosSection() {
    final RenderBox renderBox =
        _photosPaddingKey.currentContext?.findRenderObject() as RenderBox;
    if (renderBox != null) {
      final offset = renderBox.localToGlobal(Offset.zero);
      return offset.dy - 10; // Adjust as needed
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF4E9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFF4E9),
        title: Padding(
          padding: EdgeInsets.only(top: h * 0.05, right: w * 0.5),
          child: SvgPicture.asset(
            'assets/svgs/#2 - lichenpedia.svg',
            width: w * 0.1,
            height: h * 0.047,
          ),
        ),
        elevation: 0,
        toolbarHeight: 80.0,
      ),

      // Body
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text(
                    'Welcome to Lichenpedia, your passport to Lichen Planus knowledge. Here, you\'ll find a treasure trove of educational resources, carefully curated to help you understand and navigate the complexities of this unique skin condition, Lichenpedia is your go-to-destination!',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Lichen Planus',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 15),
              Container(
                width: 320,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF7F50),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: _buildTextWithDivider('Overview'),
                    ),
                    _buildTextWithDivider('Photos'),
                    _buildTextWithDivider('Causes'),
                    _buildTextWithDivider('Symptoms'),
                    _buildTextWithDivider('Treatments'),
                    _buildTextWithDivider('Variants of Lichen Planus'),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 45),
                child: Container(
                  // Adjust the padding
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/lichenpedia_variant');
                    },
                    child: Text(
                      'Variants of Lichen Planus',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFF7F50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Colors.white,
                              width: 2.0), // Add the white border here
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text(
                    'What is Lichen Planus?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text(
                    'The term Lichen Planus (LP) or pronounced as (like-en play-nes) stems from the Greek word “leichen”, which means “tree moss”, and the Latin word “planus”, which means “flat”, which aptly describes the surface of the cutaneous lesion. Lichen Planus is an uncommon skin disorder that presents as an itchy rash that appears as flat-topped, itchy, purple-colored bumps of the skin. While LP is a non-contagious skin disease, it can affect any part of the body of the person with it and is most commonly found on the wrists, ankles, lower back, and mouth. LP belongs to a group of chronic inflammatory skin conditions with characteristic clinical and histopathologic findings, ranging from common to rare called lichenoid dermatoses. Commonly, the LP presents many variants in morphology and location also exist.',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 140),
              const Center(
                child: Text(
                  'Photos of Lichen Planus',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  'Overview of Lichen Planus',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text(
                    'How does Lichen Planus affect my body?',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text(
                    'Lichen Planus commonly affects the skin around a person’s wrists and elbows (flexor surfaces), the back of your hands (dorsal surfaces), and the fronts of your lower legs. About half of all people who have lichen planus develop oral lichen planus, which affects the skin inside of your mouth and your tongue. The lesions on the body of a person with lichen planus usually start as tiny, raised dots (papules) that are about the size of the tip of a pin (0.4 millimeters [mm]). They may grow up to the width of a pencil (1 centimeter [cm]).',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text(
                    'Photos',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/imgs/lichenpedia_image1.png',
                    ),
                    Image.asset(
                      'assets/imgs/lichenpedia_image2.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Symptoms of Lichen Planus',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Photos of Lichen Planus',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text('Symptoms of Lichen Planus',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 45, right: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'A variety of symptoms of lichen planus can be seen depending on the parts of an individual\'s body affected and its specificity. The following are the common symptoms of Lichen Planus from different parts of the body:',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Skin',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'The primary symptoms often involve the presence of shiny, red or purple raised bumps on the skin. These bumps are typically solid and can vary in their level of itchiness, ranging from mild to intense. An individual may experience a few or numerous of theses bumps. Additionally, there is a noticeable fine white lines or scales accompanying the bumps. While they can appear on various parts of the body, they are most frequently found on the wrists, arms, back and ankles.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 75),
              const Center(
                child: Text(
                  'Treatments of Lichen Planus',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  'Symptoms of Lichen Planus',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text('Treatments',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text('General Measures',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 55.0, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '· Avoidance of soap and shower gel that will exacerbate scaling',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '· Avoidance of UV light',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '· Use of emollients regularly',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text('Specific Measures (Topical Treatments)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 55.0, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '· Topical corticosteroids, such as clobetasol, for mild to moderate cutaneous involvement',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '· Topical tacrolimus can be useful for sites of skin atrophy, but not ideal for areas with active lesions and erosions',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '· Topical budesonide for oral GVHD Moisturizers and antihistamines for itch.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text('Specific Measures (Systematic Treatments)',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 45.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'First line:',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 55.0, right: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '· Oral corticosteroids, a common treatment for acute asthma flare-ups',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 80),
              const Center(
                child: Text(
                  'Diagnosis of Lichen Planus',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0),
                  child: Text('Diagnosis',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text('How is Lichen Planus diagnosed?',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text(
                    'Lichen planus is usually diagnosed by your healthcare provider through a symptom assessment and physical examination. They\'ll often search for key features, referred to as the "Six Ps," to confirm the diagnosis:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 55.0, right: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '1. Prutitic (They\'re itchy).',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '2. Polygonal (Your rash shape has many sharp angles)',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '3. Planar (The top is flat).',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '4. Purple (They present a purplish color)',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '5. Papules (presence of bumps)',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '6. Plagues (raised, discolored, patches)',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text(
                    'If there\'s any doubt, your healtcare provider may perform the following tests:',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text(
                    'Allergy test. An allergy test can determine if you have an allergy that\'s causing your lichen planus flare-up',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Center(
                child: Text(
                  'Treatments of Lichen Planus',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_arrow_up,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 55.0, right: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '· For oral lichen planus, stop smoking, avoid alcohol, maintain good oral hygiene, and avoid any foods that seem to irritate your mouth.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Lichen Planus is not a dangerous disease, and it usually goes away on its own. However, in some people, it may come back.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Jump to Overview',
                  style: TextStyle(
                    color: Color(0xFFFF7F50),
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _onArrowDownPressed,
                      icon: const Icon(Icons.keyboard_double_arrow_up_outlined,
                          color: Color(0xFFFF7F50)),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 35.0, right: 35),
                  child: Text(
                    'Discover more about Lichen Planus',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                    textAlign: TextAlign
                        .center, // Center align the text within the Text widget
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 45),
                child: Container(
                  // Adjust the padding
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/lichenpedia_vault');
                    },
                    child: Text(
                      'Explore Lichen Planus through Online Videos',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFF7F50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Colors.white,
                              width: 2.0), // Add the white border here
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 45),
                child: Container(
                  // Adjust the padding
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/lichenpedia_archive');
                    },
                    child: Text(
                      'Discover Lichen Planus through Academic Publications',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFF7F50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Colors.white,
                              width: 2.0), // Add the white border here
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 45),
                child: Container(
                  // Adjust the padding
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/lichenpedia_reference');
                    },
                    child: Text(
                      ' See References and Sources                ',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFFFF7F50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Colors.white,
                              width: 2.0), // Add the white border here
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const SizedBox(height: 80),
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
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
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
