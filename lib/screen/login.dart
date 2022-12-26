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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Container(
            margin: const EdgeInsets.fromLTRB(25, 104, 24, 01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Đăng",
                    style: TextStyle(
                        color: Color(0xff030323),
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
                  height: 24,
                ),
                Form(
                    key: formEmail,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text.rich(TextSpan(
                            style: TextStyle(
                                color: Colors.black,
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
                        //Email
                        ConstrainedBox(
                          constraints:
                              const BoxConstraints.tightFor(height: 70),
                          child: SizedBox(
                              height: 48,
                              child: TextFormField(
                                controller: _controller,
                                style: const TextStyle(
                                    fontFamily: "roboto",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                                //luôn kiểm tra tính đúng sai
                                autovalidateMode: AutovalidateMode.always,
                                onChanged: (text) {
                                  // String value = text;
                                  // if (value.isEmpty) {}
                                  // builder:(context)=>
                                },
                                validator: (value) {
                                  name = value!;
                                  if (value == "admin") {
                                    return null;
                                  } else if (value.isEmpty ||
                                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                          .hasMatch(value)) {
                                    return "Email không tồn tại";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    isCollapsed: false,
                                    isDense: true,
                                    //icon:
                                    suffixIcon: IconButton(
                                      onPressed: _controller.clear,
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF929292),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    constraints: const BoxConstraints(
                                        maxHeight: 70, minHeight: 48),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFFFA700)))),
                              )),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text.rich(TextSpan(
                            style: TextStyle(
                                color: Colors.black,
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
                        //Password
                        ConstrainedBox(
                          constraints:
                              const BoxConstraints.tightFor(height: 70),
                          child: TextFormField(
                              style: const TextStyle(
                                  fontFamily: "roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
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
                                  isCollapsed: false,
                                  isDense: true,
                                  suffixIcon: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                        "assets/images/visibility_off.png"),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFFFFA700))))),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(2, 4, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CheckGhiNhoDangNhap(),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    GestureDetector(
                                      onTap: (() {
                                        print("object");
                                        isChecked = !isChecked;
                                      }),
                                      child: Text("Ghi nhớ đăng nhập",
                                          style: TextStyle(
                                              color: Color(0xff929292),
                                              fontSize: 14,
                                              fontFamily: "roboto",
                                              fontWeight: FontWeight.w400)),
                                    ),
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
                                              fontWeight: FontWeight.w400))),
                                )
                              ],
                            )),
                        const SizedBox(height: 17.5),
                        SizedBox(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6)),
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
                                            color: Color(0xffffffff),
                                            fontSize: 16,
                                            fontFamily: "roboto",
                                            fontWeight: FontWeight.w700)))),
                          ),
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      height: 48,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFEEF1F4),
                          ),
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
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
                                      color: Color(0xff667080),
                                      fontSize: 16,
                                      fontFamily: "roboto",
                                      fontWeight: FontWeight.w700)),
                              const Expanded(child: SizedBox()),
                              const SizedBox(width: 6),
                            ],
                          )),
                    ),
                  ),
                  const SizedBox(width: 31),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFEEF1F4),
                          ),
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
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
                                      color: Color(0xff667080),
                                      fontSize: 16,
                                      fontFamily: "roboto",
                                      fontWeight: FontWeight.w700)),
                              const Expanded(child: SizedBox()),
                              const SizedBox(width: 8),
                            ],
                          )),
                    ),
                  ),
                ]),
                // SizedBox(height: 16),
                Center(
                    // ignore: prefer_const_literals_to_create_immutables
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Chưa có tài khoản?",
                        style: TextStyle(
                            color: Color(0xff929292),
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
        ]));
  }
}

bool isChecked = false;

class CheckGhiNhoDangNhap extends StatefulWidget {
  const CheckGhiNhoDangNhap({super.key});

  @override
  State<CheckGhiNhoDangNhap> createState() => _CheckGhiNhoDangNhap();
}

class _CheckGhiNhoDangNhap extends State<CheckGhiNhoDangNhap> {
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      return const Color(0xFFFFA700);
    }

    return SizedBox(
        height: 20,
        width: 20,
        child: (CheckboxListTile(
          title: Text("data"),
          // child: Text("data"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          // checkColor: Colors.white,
          // fillColor: MaterialStateProperty.resolveWith(getColor),
          checkColor: Colors.white,
          activeColor: Color(0xFFFFA700),

          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        )));
  }
}

var _controller = TextEditingController();
// ignore_for_file: prefer_const_constructors

class MyInputField extends StatefulWidget {
  const MyInputField(
      {super.key,
      required this.controller,
      this.placeholder,
      this.suffixIcon,
      this.obscureText,
      this.validate});

  final TextEditingController controller;
  final String? placeholder;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? Function(String?)? validate;

  @override
  State<MyInputField> createState() => MyInputFieldState();
}

class MyInputFieldState extends State<MyInputField> {
  bool isValidate = false;
  void setIsValidate(value) {
    setState(() {
      isValidate = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          BoxConstraints.tightFor(height: isValidate == true ? 70 : 48),
      child: TextFormField(
        obscureText: widget.obscureText ?? false,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          color: Colors.red,
          fontSize: 14,
        ),
        controller: widget.controller,
        validator: (text) {
          if (widget.validate != null) {
            String? validText = widget.validate!(text);
            setIsValidate(validText != null);
            return validText;
          }
          setIsValidate(false);
          return null;
        },
        decoration: InputDecoration(
            filled: true,
            hintText: widget.placeholder,
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            fillColor: Colors.white,
            suffixIcon: widget.suffixIcon != null
                ? Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: widget.suffixIcon,
                  )
                : null,
            // suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            hintStyle: TextStyle(fontSize: 14.0, color: Colors.white)),
      ),
    );
  }
}
