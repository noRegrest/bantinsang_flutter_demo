// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';

void main() => runApp(loginpage());
// void main() => runApp(homepage());

class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "login",
        theme: ThemeData(),
        initialRoute: '/',
        routes: {
          '/': (context) => loginpage(),
          '/home': (context) => homepage()
        },
        home: SafeArea(
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
                                      borderSide: BorderSide(
                                          color: Color(0xFFFFA700)))),
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
                                    checkGhiNhoDangNhap(),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text("Ghi nhớ đăng nhập",
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 146, 146, 146),
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
                ]))));
  }
}

class homepage extends StatelessWidget {
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/iconFacebook.png'),
              Row(
                children: [
                  Image.asset('assets/images/iconFacebook.png'),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Ink.image(
                        image: AssetImage('assets/images/iconFacebook.png'),
                        fit: BoxFit.fill,
                        child: InkWell(
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}

class checkGhiNhoDangNhap extends StatefulWidget {
  const checkGhiNhoDangNhap({super.key});

  @override
  State<checkGhiNhoDangNhap> createState() => _checkGhiNhoDangNhap();
}

class _checkGhiNhoDangNhap extends State<checkGhiNhoDangNhap> {
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
