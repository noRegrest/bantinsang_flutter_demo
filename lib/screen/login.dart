import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'home.dart';

final Dio dio = Dio();

bool isChecked = false;
bool _isPasswordHidden = true;
bool _isEmailFormEmpty = true;
bool _isEmailCorrect = false;
bool _isPasswordCorrect = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final bool _isloading = false;
  late String _errorMessage;
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
                                controller: _emailController,
                                style: const TextStyle(
                                    fontFamily: "roboto",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                                //luôn kiểm tra tính đúng sai
                                autovalidateMode: AutovalidateMode.always,
                                onChanged: (text) {
                                  if (text.isEmpty) {
                                    setState(() {
                                      _isEmailFormEmpty = true;
                                    });
                                  } else {
                                    setState(() {
                                      _isEmailFormEmpty = false;
                                    });
                                  }
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
                                    suffixIcon: Visibility(
                                        visible: !_isEmailFormEmpty,
                                        child: IconButton(
                                          onPressed: _emailController.clear,
                                          // onPressed: () {
                                          //   setState(() {
                                          //     _emailController.clear;
                                          //     _isEmailFormEmpty = true;
                                          // });
                                          // if (_emailController.text.isEmpty) {
                                          //   setState(() {
                                          //   });
                                          // }
                                          // },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Color(0xFF929292),
                                          ),
                                        )),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    constraints: const BoxConstraints(
                                        maxHeight: 70, minHeight: 48),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
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
                              controller: _passController,
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
                              obscureText: _isPasswordHidden,
                              decoration: InputDecoration(
                                  isCollapsed: false,
                                  isDense: true,
                                  suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _isPasswordHidden =
                                              !_isPasswordHidden;
                                        });
                                      },
                                      child: Image.asset(_isPasswordHidden
                                          ? "assets/images/visibility_off.png"
                                          : "assets/images/visibility_on.png")),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFFA700))))),
                        ),
                        Container(
                            margin: const EdgeInsets.fromLTRB(2, 4, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CheckGhiNhoDangNhap(),
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
                          child: SizedBox(
                            height: 50,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFA700),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                                onPressed: () {
                                  checkLogin(_emailController.text,
                                      _passController.text);
                                      ,
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                      color: Color(0xff667080),
                                      fontSize: 16,
                                      fontFamily: "roboto",
                                      fontWeight: FontWeight.w700)),
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                              const SizedBox(width: 8),
                            ],
                          )),
                    ),
                  ),
                ]),
                Center(
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

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (() {
        setState(() {
          isChecked = !isChecked;
        });
      }),
      child: Row(
        children: [
          SizedBox(
              height: 20,
              width: 20,
              child: Expanded(
                child: (Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  checkColor: Colors.white,
                  activeColor: const Color(0xFFFFA700),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                )),
              )),
          const SizedBox(
            width: 6,
          ),
          const SizedBox(
            height: 21,
            child: Center(
              child: Text("Ghi nhớ đăng nhập",
                  style: TextStyle(
                      color: Color(0xff929292),
                      fontSize: 14,
                      fontFamily: "roboto",
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}

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
        style: const TextStyle(
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
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(6))),
            fillColor: Colors.white,
            suffixIcon: widget.suffixIcon != null
                ? Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                    child: widget.suffixIcon,
                  )
                : null,
            contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            hintStyle: const TextStyle(fontSize: 14.0, color: Colors.white)),
      ),
    );
  }
}

void checkLogin(String email, String password) async {
  try {
    Response response =
        await dio.post("http://10.0.2.2:4000/v1/mobile/check-login/login",
            options: Options(headers: {
              // 'accept': 'application/json',
              'x-token': 'api_toke_mobile',
              'Content-Type': 'application/json'
            }),
            data: {'Email': email, 'Password': password});
    // ignore: void_checks
    return (response.data);
  } catch (e) {
    print(e);
  }
}
