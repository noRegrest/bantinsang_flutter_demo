import 'package:flutter/material.dart';

import 'login.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.fromLTRB(24, 68, 24, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/bts-vie-ngang-color 1.png',
                      height: 46,
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: 32,
                            width: 80,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.white,
                                  backgroundColor: const Color(0xFFD9D9D9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  minimumSize: Size.zero, // Set this
                                  padding: EdgeInsets.zero, // and this
                                ),
                                onPressed: () {},
                                icon: Image.asset("assets/images/starcoin.png"),
                                label: const Text("300 xu",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400)))),
                        const SizedBox(
                          width: 12,
                        ),
                        Image.asset(
                          'assets/images/Vector.png',
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 26),
                // tìm kiếm
                Container(
                  height: 48,
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.fromLTRB(12, 0, 14, 0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      Image.asset("assets/images/kinhlup.png"),
                      const SizedBox(width: 11.69),
                      const Expanded(
                          child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Tìm kiếm',
                            hintStyle: TextStyle(
                                fontFamily: "roboto",
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFFA0A3BD))),
                      )),
                      Image.asset("assets/images/filter.png"),
                      // InputDecoratorExample()
                      // Prefixicon(Image.asset("assets/images/kinhlup.png")),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                // vuốt ngang

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.white,
                  ),
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageWidget()),
                          );
                        },
                        onLongPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: SizedBox(
                          width: 310,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/image1.png",
                                  height: 165),
                              const SizedBox(height: 10),
                              const Text("Thế giới",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'roboto',
                                    fontSize: 13,
                                  )),
                              const SizedBox(height: 10),
                              const Text(
                                  "Triều Tiên phóng tên lửa, Hàn Quốc phát cảnh báo trên đảo tiền tiêu",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.12,
                                      fontFamily: 'roboto',
                                      fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Image.asset("assets/images/clock.png"),
                                  const SizedBox(width: 5.17),
                                  const Text("4 giờ trước")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageWidget()),
                          );
                        },
                        onLongPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: SizedBox(
                          width: 310,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/image1.png",
                                  height: 165),
                              const SizedBox(height: 10),
                              const Text("Thế giới",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'roboto',
                                    fontSize: 13,
                                  )),
                              const SizedBox(height: 10),
                              const Text(
                                  "Triều Tiên phóng tên lửa, Hàn Quốc phát cảnh báo trên đảo tiền tiêu",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.12,
                                      fontFamily: 'roboto',
                                      fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Image.asset("assets/images/clock.png"),
                                  const SizedBox(width: 5.17),
                                  const Text("4 giờ trước")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageWidget()),
                          );
                        },
                        onLongPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: SizedBox(
                          width: 310,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/image1.png",
                                  height: 165),
                              const SizedBox(height: 10),
                              const Text("Thế giới",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'roboto',
                                    fontSize: 13,
                                  )),
                              const SizedBox(height: 10),
                              const Text(
                                  "Triều Tiên phóng tên lửa, Hàn Quốc phát cảnh báo trên đảo tiền tiêu",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.12,
                                      fontFamily: 'roboto',
                                      fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Image.asset("assets/images/clock.png"),
                                  const SizedBox(width: 5.17),
                                  const Text("4 giờ trước")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePageWidget()),
                          );
                        },
                        onLongPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        child: SizedBox(
                          width: 310,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/image1.png",
                                  height: 165),
                              const SizedBox(height: 10),
                              const Text("Thế giới",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'roboto',
                                    fontSize: 13,
                                  )),
                              const SizedBox(height: 10),
                              const Text(
                                  "Triều Tiên phóng tên lửa, Hàn Quốc phát cảnh báo trên đảo tiền tiêu",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.12,
                                      fontFamily: 'roboto',
                                      fontSize: 16)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Image.asset("assets/images/clock.png"),
                                  const SizedBox(width: 5.17),
                                  const Text("4 giờ trước")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),
                // chuyển tab
                // /*
                Row(
                  children: const [
                    Text("Gần đây",
                        style: TextStyle(
                            color: Color(0xFFFFA700),
                            fontFamily: 'roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(width: 22),
                    Text("Nổi bật",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(width: 22),
                    Text("Xem nhiều",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                    SizedBox(width: 22),
                    Text("Tin VIP",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
                // */

                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 2,
                  width: 59,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFFFA700))),
                ),
                // tin tức
                Container(
                    margin: const EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 2.png")),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(left: 4),
                              height: 96,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 3),
                                  const Text("Thời sự",
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'roboto',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(height: 4),
                                  const Text(
                                      "Việt - Trung ra tuyên bố chung, nhất trí tăng cường hợp tác",
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  const Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                              "assets/images/clock.png"),
                                          const SizedBox(height: 1)
                                        ],
                                      ),
                                      const SizedBox(width: 5.17),
                                      Column(
                                        children: const [
                                          Text("14 phút",
                                              style: TextStyle(
                                                  color: Color(0xFF000000),
                                                  fontFamily: 'roboto',
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400)),
                                          SizedBox(height: 1)
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Image.asset("assets/images/dot.png")
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ])),
                Container(
                    margin: const EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 3.png")),
                          Expanded(
                              child: (Container(
                            margin: const EdgeInsets.only(left: 4),
                            width: 200,
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 3),
                                const Text("Thể thao",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 4),
                                const Text(
                                    "Liverpool nhì bảng tại Champions League",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                const Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset("assets/images/clock.png"),
                                        const SizedBox(height: 1)
                                      ],
                                    ),
                                    const SizedBox(width: 5.17),
                                    Column(
                                      children: const [
                                        Text("14 phút",
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'roboto',
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(height: 1)
                                      ],
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Image.asset("assets/images/dot.png")
                                  ],
                                ),
                              ],
                            ),
                          )))
                        ],
                      )
                    ])),
                Container(
                    margin: const EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 4.png")),
                          Expanded(
                              child: (Container(
                            margin: const EdgeInsets.only(left: 4),
                            width: 200,
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 3),
                                const Text("Quốc tế",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 4),
                                const Text(
                                    "Ông Putin nêu điều kiện nối lại thỏa thuận ngũ cốc Ukraine",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                const Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset("assets/images/clock.png"),
                                        const SizedBox(height: 1)
                                      ],
                                    ),
                                    const SizedBox(width: 5.17),
                                    Column(
                                      children: const [
                                        Text("14 phút",
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'roboto',
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(height: 1)
                                      ],
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Image.asset("assets/images/dot.png")
                                  ],
                                ),
                              ],
                            ),
                          )))
                        ],
                      )
                    ])),
                Container(
                    margin: const EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 5.png")),
                          Expanded(
                              child: (Container(
                            margin: const EdgeInsets.only(left: 4),
                            width: 200,
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 3),
                                const Text.rich(TextSpan(
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 13,
                                        fontFamily: "roboto",
                                        fontWeight: FontWeight.w400),
                                    children: [
                                      TextSpan(text: "Giải trí - "),
                                      TextSpan(
                                          text: "VIP (2 xu)",
                                          style: TextStyle(
                                              color: Color(0xFFFFA700)))
                                    ])),
                                const SizedBox(height: 4),
                                const Text("Loạt phim ra rạp tháng 11",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                const Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset("assets/images/clock.png"),
                                        const SizedBox(height: 1)
                                      ],
                                    ),
                                    const SizedBox(width: 5.17),
                                    Column(
                                      children: const [
                                        Text("14 phút",
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'roboto',
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(height: 1)
                                      ],
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Image.asset("assets/images/dot.png")
                                  ],
                                ),
                              ],
                            ),
                          )))
                        ],
                      )
                    ])),
                Container(
                    margin: const EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 6.png")),
                          Expanded(
                              child: (Container(
                            margin: const EdgeInsets.only(left: 4),
                            width: 200,
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 3),
                                const Text("Thời sự",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                                const SizedBox(height: 4),
                                const Text(
                                    "Việt - Trung ra tuyên bố chung, nhất trí tăng cường hợp tác",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                const Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset("assets/images/clock.png"),
                                        const SizedBox(height: 1)
                                      ],
                                    ),
                                    const SizedBox(width: 5.17),
                                    Column(
                                      children: const [
                                        Text("14 phút",
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'roboto',
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400)),
                                        SizedBox(height: 1)
                                      ],
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Image.asset("assets/images/dot.png")
                                  ],
                                ),
                              ],
                            ),
                          )))
                        ],
                      )
                    ])),
              ],
            )),
      ),

      //bottom navi
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/homeicon.png'),
            activeIcon: Image.asset('assets/images/homeicon.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/compassicon.png'),
            label: 'Chuyên mục',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/bookmarkicon.png'),
            label: 'Quan tâm',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/profileicon.png'),
            label: 'Cá nhân',
            // labelStyle: MaterialStateTextStyle.resolveWith(
            //     (Set<MaterialState> states) {
            //   final Color color = states.contains(MaterialState.error)
            //       ? Theme.of(context).errorColor
            //       : Colors.orange;
            //   return TextStyle(color: color, letterSpacing: 1.3);
            // })
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
