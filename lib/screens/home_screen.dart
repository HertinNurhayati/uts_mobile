import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uts_mobile/models/doctor_model.dart';
import 'package:uts_mobile/models/service_model.dart';
import 'package:uts_mobile/screens/profile_screen.dart';
import 'package:uts_mobile/screens/doctor_detail_screen.dart';
import 'package:uts_mobile/screens/about_screen.dart';
import 'package:uts_mobile/screens/messages_screen.dart';
import 'package:uts_mobile/screens/notifications_screen.dart';

//var selectedService = 0;
var menus = [
  FeatherIcons.home,
  FeatherIcons.heart,
  FeatherIcons.messageCircle,
  FeatherIcons.user
];
//var selectedMenu = 0;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedService = 0;
  var selectedMenu = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _greetings(),
              const SizedBox(height: 16),
              _card(),
              const SizedBox(height: 20),
              _search(),
              const SizedBox(height: 20),
              _services(),
              const SizedBox(height: 27),
              _doctors()
            ],
          ),
        ),
      ),
    );
  }

  // Menambahkan widget footer
  Widget _footer() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFFF6F6F6),
      child: Center(
        child: Text(
          '© 2024 Aplikasi Layanan Dokter Hewan. All Rights Reserved.',
          style: GoogleFonts.manrope(
            fontSize: 12,
            color: const Color(0xFF3F3E3F),
          ),
        ),
      ),
    );
  }
 BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
        selectedItemColor: const Color(0xFF818AF9),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(menus[0]), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(menus[1]), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(menus[2]), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(menus[3]), label: 'Profile'),
        ],
        currentIndex: selectedMenu,
        onTap: (index) {
          setState(() {
            selectedMenu = index;
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutScreen()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MessagesScreen()),
              );
            } else if (index == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            }
          });
        },

        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xFFBFBFBF),
      );


  ListView _doctors() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => _doctor(doctors[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 11,
            ),
        itemCount: doctors.length);
  }

GestureDetector _doctor(DoctorModel doctorModel) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorDetailScreen(
            doctorName: doctorModel.name,
            doctorImage: doctorModel.image,
            doctorServices: doctorModel.services,
            description: """
              Dokter ini menyediakan layanan: ${doctorModel.services.join(', ')}.
              Harga layanan mulai dari: ${doctorModel.price} IDR.
              Penawaran spesial: ${doctorModel.specialOffers.isNotEmpty ? doctorModel.specialOffers : 'Tidak ada penawaran saat ini.'}
            """, // Deskripsi layanan, harga, dan penawaran
          ),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF35385A).withOpacity(.12),
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.asset(
              'assets/images/${doctorModel.image}',

              width: 88,
              height: 103,
            ),
          ),
          const SizedBox(width: 20),
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name,
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3E3F),
                  ),
                ),
                const SizedBox(height: 7),
                RichText(
                  text: TextSpan(
                    text: "Service: ${doctorModel.services.join(', ')}",
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(
                      FeatherIcons.mapPin,
                      size: 14,
                      color: Color(0xFFACA3A3),
                    ),
                    const SizedBox(width: 7),
                    Text(
                      "${doctorModel.distance}km",
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        color: const Color(0xFFACA3A3),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  "Harga mulai dari: ${doctorModel.price} IDR",
                  style: GoogleFonts.manrope(
                    color: const Color(0xFF50CC98),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    Text(
                      "Available for",
                      style: GoogleFonts.manrope(
                        color: const Color(0xFF50CC98),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/svgs/cat.svg'),
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/svgs/dog.svg'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: selectedService == index
                        ? const Color(0xFF818AF9)
                        : const Color(0xFFF6F6F6),
                    border: selectedService == index
                        ? Border.all(
                            color: const Color(0xFFF1E5E5).withOpacity(.22),
                            width: 2)
                        : null,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  Service.all()[index],
                  style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: selectedService == index
                          ? Colors.white
                          : const Color(0xFF3F3E3F).withOpacity(.3)),
                )),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: Service.all().length),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
          color: const Color(0xFFF6F6F6),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(
              FeatherIcons.search,
              color: Color(0xFFADACAD),
            ),
            hintText: "Find best vaccinate, treatment...",
            hintStyle: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFCACACA),
                height: 150 / 100)),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF818AF9),
        ),
        child: Stack(children: [
          Image.asset(
            'assets/images/background_card.png',
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Your ",
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            color: const Color(0xFFDEE1FE),
                            height: 150 / 100),
                        children: const [
                      TextSpan(
                          text: "Health",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: " Partner"),
                    ])),
                const SizedBox(height: 10),
                Text("Get your vaccine now!",
                    style: GoogleFonts.manrope(
                        fontSize: 12, color: const Color(0xFFDEE1FE))),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF50CC98),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text("Let's Go"),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }


  Container _greetings() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hello, User!",
            style: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
            child: const Icon(FeatherIcons.bell, color: Color(0xFF818AF9)),
          ),
        ],
      ),
    );
  }
}

