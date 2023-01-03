import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model.dart';
import 'home.dart';

final Dio dio = Dio();
bool isChecked = false;
bool _isPasswordHidden = true;
bool _isEmailFormEmpty = true;
bool _isEmailCorrect = false;
bool _isPasswordFormEmpty = true;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  // ignore: prefer_typing_uninitialized_variables
  String? _errorMessage;
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
                          constraints: BoxConstraints.tightFor(
                              height: _isEmailCorrect == false ? 80 : 48),
                          child: SizedBox(
                              child: TextFormField(
                            controller: _emailController,
                            style: const TextStyle(
                                fontFamily: "roboto",
                                fontWeight: FontWeight.w400,
                                fontSize: 14),
                            autovalidateMode: AutovalidateMode.always,
                            onChanged: (text) {
                              if (text.isEmpty) {
                                setState(() {
                                  _isEmailFormEmpty = true;
                                });
                              } else {
                                setState(() {
                                  _isEmailCorrect = false;
                                  _isEmailFormEmpty = false;
                                });
                              }
                            },
                            validator: (value) {
                              name = value!;
                              if (value.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                      .hasMatch(value)) {
                                _isEmailCorrect = false;
                                return "Vui lòng nhập Email";
                              } else {
                                _isEmailCorrect = true;
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                isCollapsed: false,
                                isDense: true,
                                errorStyle: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffC30052)),
                                suffixIcon: Visibility(
                                    visible: !_isEmailFormEmpty,
                                    child: IconButton(
                                      onPressed: () {
                                        _emailController.clear();
                                        setState(() {
                                          _isEmailFormEmpty = true;
                                          _isEmailCorrect = false;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Color(0xFF929292),
                                      ),
                                    )),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFFFA700)))),
                          )),
                        ),
                        const SizedBox(
                          height: 4,
                        ),

                        const SizedBox(
                          height: 16,
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
                          constraints: BoxConstraints.tightFor(
                              height: _isPasswordFormEmpty == true ? 80 : 48),
                          child: TextFormField(
                              controller: _passController,
                              onChanged: (text) {
                                if (_isPasswordFormEmpty) {
                                  _errorMessage = null;
                                }
                                setState(() {
                                  _isPasswordFormEmpty = true;
                                });
                              },
                              autovalidateMode: AutovalidateMode.always,
                              style: const TextStyle(
                                  fontFamily: "roboto",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  _isPasswordFormEmpty = true;
                                  return "Vui lòng điền mật khẩu";
                                } else {
                                  _isPasswordFormEmpty = true;
                                  return _errorMessage;
                                }
                              },
                              obscureText: _isPasswordHidden,
                              decoration: InputDecoration(
                                  isCollapsed: false,
                                  isDense: true,
                                  errorStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xffC30052)),
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
                            margin: const EdgeInsets.fromLTRB(2, 10, 0, 0),
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
                        const SizedBox(height: 18),
                        SizedBox(
                          child: SizedBox(
                            height: 50,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xFFFFA700),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    )),
                                onPressed: () async {
                                  _errorMessage = null;

                                  if (formEmail.currentState!.validate()) {
                                    User user = await checkLogin(
                                        email: _emailController.text.trim(),
                                        password: _passController.text.trim());
                                    if (user.status == true) {
                                      // ignore: use_build_context_synchronously
                                      setState(() {
                                        _isEmailCorrect = true;
                                        _isEmailFormEmpty = false;
                                        _isPasswordFormEmpty = false;
                                      });

                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePageWidget()),
                                      );
                                    } else {
                                      setState(() {
                                        _errorMessage = user.message;
                                      });
                                      print(_errorMessage);
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

Future<User> checkLogin(
    {required String email, required String password}) async {
  try {
    Response response = await dio.post(
        "http://10.0.2.2:4000/v1/mobile/check-login/login",
        options: Options(headers: {
          'x-token': 'api_toke_mobile',
          'Content-Type': 'application/json'
        }),
        data: {'Email': email, 'Password': password});
    var outputResponse = User.fromJson(response.data);
    return (outputResponse);
  } on DioError catch (e) {
    print(e);
    return User(status: false);
  }
}
