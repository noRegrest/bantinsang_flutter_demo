// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const HomePageWidget(),
    );
  }
}

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
            margin: EdgeInsets.fromLTRB(24, 68, 24, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // logo
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/bts-vie-ngang-color 1.png'),
                    Row(
                      children: [
                        SizedBox(
                            height: 32,
                            width: 80,
                            child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFD9D9D9),
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
                        SizedBox(
                            height: 32,
                            width: 32,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                minimumSize: Size.zero, // Set this
                                padding: const EdgeInsets.fromLTRB(
                                    6, 0, 0, 0), // and this
                              ),
                              onPressed: () {},
                              icon: Image.asset('assets/images/Vector.png'),
                              label: Text(''),
                            )),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 26),
                // tìm kiếm
                Container(
                  height: 48,
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.fromLTRB(12, 0, 14, 0),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6)),
                  child: Row(
                    children: [
                      Image.asset("assets/images/kinhlup.png"),
                      Expanded(
                          child: TextField(
                        decoration:
                            InputDecoration.collapsed(hintText: 'Tìm kiếm'),
                      )),
                      Image.asset("assets/images/filter.png"),
                      // InputDecoratorExample()
                      // Prefixicon(Image.asset("assets/images/kinhlup.png")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                // vuốt ngang
                /*ListView(
                  scrollDirection: Axis.horizontal,
                  children: [*/
                SizedBox(
                  width: 333,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/image1.png"),
                      SizedBox(height: 10),
                      Text("Thế giới",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontFamily: 'roboto',
                              fontSize: 13)),
                      SizedBox(height: 10),
                      Text(
                          "Triều Tiên phóng tên lửa, Hàn Quốc phát cảnh báo trên đảo tiền tiêu",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.12,
                              fontFamily: 'roboto',
                              fontSize: 16)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset("assets/images/clock.png"),
                          SizedBox(width: 5.17),
                          Text("4 giờ trước")
                        ],
                      )
                    ],
                  ),
                ),
                /*
                  ],
                ),*/

                SizedBox(height: 15),
                // chuyển tab
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
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 2,
                  width: 59,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFFA700))),
                ),
                // tin tức
                Container(
                    margin: EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 2.png")),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 4),
                              height: 96,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Thời sự",
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'roboto',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400)),
                                  SizedBox(height: 4),
                                  Text(
                                      "Việt - Trung ra tuyên bố chung, nhất trí tăng cường hợp tác",
                                      style: TextStyle(
                                          color: Color(0xFF000000),
                                          fontFamily: 'roboto',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700)),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      Image.asset("assets/images/clock.png"),
                                      SizedBox(width: 5.17),
                                      Text("14 phút",
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontFamily: 'roboto',
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400)),
                                      Expanded(child: SizedBox()),
                                      Image.asset("assets/images/dot.png")
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 3.png")),
                          Expanded(
                              child: (Container(
                            margin: EdgeInsets.only(left: 4),
                            width: 200,
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Thể thao",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 4),
                                Text("Liverpool nhì bảng tại Champions League",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Image.asset("assets/images/clock.png"),
                                    SizedBox(width: 5.17),
                                    Text("14 phút",
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontFamily: 'roboto',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                                    Expanded(child: SizedBox()),
                                    Image.asset("assets/images/dot.png")
                                  ],
                                )
                              ],
                            ),
                          )))
                        ],
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 4.png")),
                          Expanded(
                              child: (Container(
                            margin: EdgeInsets.only(left: 4),
                            width: 200,
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Quốc tế",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 4),
                                Text(
                                    "Ông Putin nêu điều kiện nối lại thỏa thuận ngũ cốc Ukraine",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Image.asset("assets/images/clock.png"),
                                    SizedBox(width: 5.17),
                                    Text("14 phút",
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontFamily: 'roboto',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                                    Expanded(child: SizedBox()),
                                    Image.asset("assets/images/dot.png")
                                  ],
                                )
                              ],
                            ),
                          )))
                        ],
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 5.png")),
                          Expanded(
                              child: (Container(
                            margin: EdgeInsets.only(left: 4),
                            width: 200,
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                SizedBox(height: 4),
                                Text("Loạt phim ra rạp tháng 11",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Image.asset("assets/images/clock.png"),
                                    SizedBox(width: 5.17),
                                    Text("14 phút",
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontFamily: 'roboto',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                                    Expanded(child: SizedBox()),
                                    Image.asset("assets/images/dot.png")
                                  ],
                                )
                              ],
                            ),
                          )))
                        ],
                      )
                    ])),
                Container(
                    margin: EdgeInsets.fromLTRB(8, 24, 0, 0),
                    child: Column(children: [
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.asset("assets/images/image 6.png")),
                          Expanded(
                              child: (Container(
                            margin: EdgeInsets.only(left: 4),
                            width: 200,
                            height: 96,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Thời sự",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(height: 4),
                                Text(
                                    "Việt - Trung ra tuyên bố chung, nhất trí tăng cường hợp tác",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                Expanded(child: SizedBox()),
                                Row(
                                  children: [
                                    Image.asset("assets/images/clock.png"),
                                    SizedBox(width: 5.17),
                                    Text("14 phút",
                                        style: TextStyle(
                                            color: Color(0xFF000000),
                                            fontFamily: 'roboto',
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400)),
                                    Expanded(child: SizedBox()),
                                    Image.asset("assets/images/dot.png")
                                  ],
                                )
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

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(children: [
              Container(
                margin: const EdgeInsets.fromLTRB(25, 104, 24, 01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Đăng",
                        style: TextStyle(
                            fontSize: 48,
                            fontFamily: "roboto",
                            fontWeight: FontWeight.w700)),
                    const Text("nhập",
                        style: TextStyle(
                            color: Color(0xFFFFA700),
                            fontSize: 48,
                            fontFamily: "roboto",
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 52,
                    ),
                    const Text.rich(TextSpan(
                        style: TextStyle(
                            color: Color.fromARGB(255, 146, 146, 146),
                            fontSize: 14,
                            fontFamily: "roboto",
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(text: "Email"),
                          TextSpan(
                              text: "*",
                              style: TextStyle(color: Color(0xFFC30052)))
                        ])),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                        height: 48,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFFFA700)))),
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text.rich(TextSpan(
                        style: TextStyle(
                            color: Color.fromARGB(255, 146, 146, 146),
                            fontSize: 14,
                            fontFamily: "roboto",
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(text: "Mật khẩu"),
                          TextSpan(
                              text: "*",
                              style: TextStyle(color: Color(0xFFC30052)))
                        ])),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                        height: 48,
                        child: TextField(
                            decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.visibility_off,
                                  color: Color.fromARGB(255, 146, 146, 146),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFFFFA700)))))),
                    Container(
                        margin: const EdgeInsets.fromLTRB(2, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                CheckGhiNhoDangNhap(),
                                SizedBox(
                                  width: 6,
                                ),
                                Text("Ghi nhớ đăng nhập",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 146, 146, 146),
                                        fontSize: 14,
                                        fontFamily: "roboto",
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {},
                                  child: Text("Quên mật khẩu?",
                                      style: TextStyle(
                                          color: Color(0xFF5890FF),
                                          fontSize: 14,
                                          fontFamily: "roboto",
                                          fontWeight: FontWeight.w400))),
                            )
                          ],
                        )),
                    const SizedBox(height: 17.5),
                    SizedBox(
                      child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0xFFFFA700),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Center(
                              child: Text("Đăng nhập",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "roboto",
                                      fontWeight: FontWeight.w700)))),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text("hoặc đăng nhập với",
                          style: TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 14,
                              fontFamily: "roboto",
                              fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                              // height: 48,
                              // width: 120,
                              child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xFFEEF1F4),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/iconFacebook.png',
                                        width: 21,
                                        height: 21,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Facebook",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 102, 112, 128),
                                              fontSize: 16,
                                              fontFamily: "roboto",
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ))),
                          SizedBox(
                              // height: 48,
                              // width: 120,
                              child: Center(
                            child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFFEEF1F4),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/iconGoogle.png',
                                      width: 21,
                                      height: 21,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Google",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 102, 112, 128),
                                            fontSize: 16,
                                            fontFamily: "roboto",
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )),
                          ))
                        ]),
                    // SizedBox(height: 16),
                    Center(
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Chưa có tài khoản?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 146, 146, 146),
                                fontSize: 14,
                                fontFamily: "roboto",
                                fontWeight: FontWeight.w400)),
                        TextButton(
                            onPressed: () {},
                            child: Text("Đăng ký",
                                style: TextStyle(
                                    fontFamily: "poppins",
                                    color: Color(0xFFFFA700))))
                      ],
                    )),
                  ],
                ),
              )
            ])));
  }
}

class InputDecoratorExample extends StatelessWidget {
  const InputDecoratorExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter name',
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          child: Icon(
            Icons.person,
          ),
        ),
      ),
    );
  }
}

class CheckGhiNhoDangNhap extends StatefulWidget {
  const CheckGhiNhoDangNhap({super.key});

  @override
  State<CheckGhiNhoDangNhap> createState() => _CheckGhiNhoDangNhap();
}

class _CheckGhiNhoDangNhap extends State<CheckGhiNhoDangNhap> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      // if (states.any(interactiveStates.contains)) {
      //   return Colors.blue;
      // }
      return Color(0xFFFFA700);
    }

    return SizedBox(
        height: 20,
        width: 20,
        child: (Checkbox(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        )));
  }
}
