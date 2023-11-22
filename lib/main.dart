import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:connexion_flutter/calendar_page.dart';

// import 'package:cupertino_icons/cupertino_icons.dart';
const dgreen = Color(0xff54D3C2);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //je desactive la bande  de deburggage
      title: "Dream Beach",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SearchSection(),
              BeachSection(),
            ],
          ),
        ));
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
          size: 20,
        ),
        onPressed: null,
      ),
      title: Text(
        'Explore',
        style: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_outline_rounded,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
        IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.grey[800],
            size: 20,
          ),
          onPressed: null,
        ),
      ],
      centerTitle: true, //pour forcer le centrage
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey[200],
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 4,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Cotonou',
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                      ),
                    ))),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                        return const  CalendarPage();
                        }),
                    );
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                  backgroundColor: dgreen,
                ),
                child: const Icon(Icons.search, size: 26),
              ),
            ),
          ],
        ),
        // const SizedBox(
        //     height:50,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choisir la date',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '12 Dec - 22 Dec',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ],
                )),
            Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre de Chambre',
                      style: GoogleFonts.nunito(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '1 Room - 2 Adults',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ],
                )),
          ],
        )
      ]),
    );
  }
}

class BeachSection extends StatelessWidget {
  final List<dynamic> hotelList = [
    {
      'title': 'Golden tulipe',
      'place': 'Boulevard de la marina',
      'distance': 2,
      'review': 36,
      'picture': 'assets/image_1.jpg',
      'prix': '\$250'
    },
    {
      'title': 'Marina Hotel',
      'place': 'Monteigne',
      'distance': 12,
      'review': 16,
      'picture': 'assets/image_2.jpg',
      'prix': '\$750'
    },
    {
      'title': 'Dream Beach Hotel',
      'place': 'Fidjrosse',
      'distance': 8,
      'review': 39,
      'picture': 'assets/image_3.jpg',
      'prix': '\$350'
    },
    {
      'title': 'Novotel',
      'place': 'Boulevard de la marina',
      'distance': 7,
      'review': 22,
      'picture': 'assets/image_4.jpg',
      'prix': '\$450'
    },
    {
      'title': 'Azanaï Hotel',
      'place': 'Boulevard de la marina',
      'distance': 2,
      'review': 45,
      'picture': 'assets/image_5.jpg',
      'prix': '\$50'
    }
  ];

  BeachSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '530 hotel found',
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Filtres',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.filter_list_outlined,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
                children: hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList()),
          ],
        ));
  }
}

class HotelCard extends StatelessWidget {
  final Map hotelData;
  const HotelCard(this.hotelData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(18),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200,
                spreadRadius: 4,
                blurRadius: 6,
                offset: const Offset(0, 3))
          ]),
      child: Column(children: [
        Container(
          height: 170,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
            image: DecorationImage(
              image: AssetImage(hotelData['picture']),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: [
            Positioned(
              top: 5,
              right: -15,
              child: MaterialButton(
                color: Colors.white,
                shape: const CircleBorder(),
                onPressed: () {},
                child: const Icon(
                  Icons.favorite_outline_rounded,
                  color: dgreen,
                  size: 20,
                ),
              ),
            )
          ]),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              hotelData['title'],
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              hotelData['prix'],
              style: GoogleFonts.nunito(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ]),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              hotelData['place'],
              style: GoogleFonts.nunito(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(children: [
              const Icon(
                Icons.place,
                color: dgreen,
                size: 14.0,
              ),
              Text(
                hotelData['distance'].toString() + 'km de la ville',
                style: GoogleFonts.nunito(
                  color: Colors.grey[500],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            ]),
            Text(
              'par nuit',
              style: GoogleFonts.nunito(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            )
          ]),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(10, 3, 10, 0),
          child: Row(
            children: [
              const Row(children: [
                Icon(
                  Icons.star_rate,
                  color: dgreen,
                  size: 14,
                ),
                Icon(
                  Icons.star_rate,
                  color: dgreen,
                  size: 14,
                ),
                Icon(
                  Icons.star_rate,
                  color: dgreen,
                  size: 14,
                ),
                Icon(
                  Icons.star_rate,
                  color: dgreen,
                  size: 14,
                ),
                Icon(
                  Icons.star_rate,
                  color: dgreen,
                  size: 14,
                ),
                Icon(
                  Icons.star_rate,
                  color: dgreen,
                  size: 14,
                ),
              ]),
              const SizedBox(
                width: 20,
              ),
              Text(
                hotelData['review'].toString() + ' review',
                style: GoogleFonts.nunito(
                  color: Colors.grey[500],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
