import 'package:flutter/material.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final formEmail = GlobalKey<FormState>();
  String formPassword = "";
  String name = "";
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
                    Form(
                        key: formEmail,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                      style:
                                          TextStyle(color: Color(0xFFC30052)))
                                ])),
                            const SizedBox(
                              height: 4,
                            ),
                            //Email
                            ConstrainedBox(
                              constraints:
                                  const BoxConstraints.tightFor(height: 70),
                              child: SizedBox(
                                  height: 48,
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.always,
                                    onChanged: (text) {
                                      // String value = text;
                                      // if (value.isEmpty) {}
                                    },
                                    // ignore: body_might_complete_normally_nullable
                                    validator: (value) {
                                      name = value!;
                                      if (value == "admin") {
                                        return null;
                                      } else if (value.isEmpty ||
                                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                              .hasMatch(value)) {
                                        return "Email sai";
                                      }
                                    },
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFFFA700)))),
                                  )),
                            ),
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
                                      style:
                                          TextStyle(color: Color(0xFFC30052)))
                                ])),
                            const SizedBox(
                              height: 4,
                            ),
                            //Password
                            ConstrainedBox(
                              constraints:
                                  const BoxConstraints.tightFor(height: 70),
                              child: SizedBox(
                                  height: 48,
                                  child: TextFormField(
                                      validator: (value) {
                                        formPassword = value!;
                                        if (formPassword == "123") {
                                          return null;
                                        } else {
                                          return "Sai mật khẩu";
                                        }
                                      },
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          suffixIcon: const Icon(
                                            Icons.visibility_off,
                                            color: Color.fromARGB(
                                                255, 146, 146, 146),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(
                                                          0xFFFFA700)))))),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(2, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: const [
                                        CheckGhiNhoDangNhap(),
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
                                          child: const Text("Quên mật khẩu?",
                                              style: TextStyle(
                                                  color: Color(0xFF5890FF),
                                                  fontSize: 14,
                                                  fontFamily: "roboto",
                                                  fontWeight:
                                                      FontWeight.w400))),
                                    )
                                  ],
                                )),
                            const SizedBox(height: 17.5),
                            SizedBox(
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFA700),
                                  ),
                                  onPressed: () {
                                    // Navigator.pushNamed(context, '/home');
                                    if (formEmail.currentState!.validate()) {
                                      if (formPassword == "123" &&
                                          name == "admin") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePageWidget()),
                                        );
                                      }
                                    }
                                  },
                                  child: const Center(
                                      child: Text("Đăng nhập",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontFamily: "roboto",
                                              fontWeight: FontWeight.w700)))),
                            ),
                          ],
                        )),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text("hoặc đăng nhập với",
                          style: TextStyle(
                              color: Color(0xFF929292),
                              fontSize: 14,
                              fontFamily: "roboto",
                              fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(height: 16),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      SizedBox(
                          height: 48,
                          width: 120,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFEEF1F4),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/iconFacebook.png',
                                    width: 21,
                                    height: 21,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Facebook",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 102, 112, 128),
                                          fontSize: 16,
                                          fontFamily: "roboto",
                                          fontWeight: FontWeight.w700)),
                                ],
                              ))),
                      const SizedBox(width: 31),
                      SizedBox(
                          height: 48,
                          width: 120,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFFEEF1F4),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    'assets/images/iconGoogle.png',
                                    width: 21,
                                    height: 21,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Text("Google",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 102, 112, 128),
                                          fontSize: 16,
                                          fontFamily: "roboto",
                                          fontWeight: FontWeight.w700)),
                                ],
                              ))),
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
                            child: const Text("Đăng ký",
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
      return const Color(0xFFFFA700);
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
