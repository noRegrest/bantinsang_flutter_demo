// ignore_for_file: unrelated_type_equality_checks

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/widgets/bottom_nav.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model.dart';
import 'bio_auth.dart';

final Dio dio = Dio();
bool isChecked = false;
bool _isPasswordHidden = true;
bool _isEmailFormEmpty = true;
bool _isEmailCorrect = false;
bool _isPasswordFormEmpty = true;
bool _isPasswordCorrect = false;

Future<bool> _isUserEmailEmpty() async {
  String userEmail = await _loadSavedString('Email');
  return userEmail.isEmpty;
}

SharedPreferences? storage;

Future<bool> _getInitialValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = await _loadSavedString('UserName');
  bool result = prefs.getBool('fingerprint_login_$username') ?? false;
  print(result);
  return result;
}

_loadSavedString(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key) ?? '';
}

_saveString(String key, String str) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, str.trim());
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  // ignore: prefer_typing_uninitialized_variables
  String? _errorMessage;
  final formEmail = GlobalKey<FormState>();
  String formPassword = "";
  String name = "";
  bool _normalLoginForced = false;

  Future<void> saveStringToPreferences(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getStringFromPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  _loginProcess(bool b, bool finger) async {
    String email = await _loadSavedString('Email');
    String password = await _loadSavedString('Password');
    if (b || formEmail.currentState!.validate()) {
      User user = await checkLogin(
          email: b == false ? _emailController.text.trim() : email,
          password: finger == false ? _passController.text.trim() : password);
      if (user.status == true) {
        // ignore: use_build_context_synchronously
        setState(() {
          _isEmailCorrect = true;
          _isEmailFormEmpty = false;
          _isPasswordFormEmpty = false;
          _isPasswordCorrect = true;
        });
        if (isChecked) {
          _saveString("Password", _passController.text);
          _saveString("Email", _emailController.text);
          _saveString("Id", user.data?.id ?? '');
          _saveString("WalletAddress", user.data?.walletAddress ?? '');
          _saveString("UserName", user.data?.userName ?? '');
          _saveString("Role", user.data?.role ?? '');
          _saveString("token", user.token ?? '');
        }
        setState(() {
          _normalLoginForced = false;
        });
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNaviButtons()),
          // const BottomNaviButtons()),
        );
      } else {
        setState(() {
          _isPasswordCorrect = false;
          _errorMessage = user.message;
        });
        print(_errorMessage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var passwordForm = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(TextSpan(
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "roboto",
                fontWeight: FontWeight.w400),
            children: [
              TextSpan(text: "Mật khẩu"),
              TextSpan(text: "*", style: TextStyle(color: Color(0xFFC30052)))
            ])),
        const SizedBox(
          height: 4,
        ),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(
              height: _isPasswordCorrect == false ? 80 : 48),
          child: TextFormField(
              controller: _passController,
              onChanged: (text) {
                if (text.isEmpty) {
                  setState(() {
                    _isPasswordCorrect = false;
                  });
                } else {
                  setState(() {
                    _isPasswordCorrect = false;
                    _isPasswordFormEmpty = false;
                  });
                }
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
                          _isPasswordHidden = !_isPasswordHidden;
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
                      borderSide: const BorderSide(color: Color(0xFFFFA700))))),
        ),
      ],
    );
    loginButton(bool b) {
      return Column(
        children: [
          Container(
              margin: const EdgeInsets.fromLTRB(2, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!b) const CheckGhiNhoDangNhap(),
                  const Expanded(child: SizedBox()),
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

                    _loginProcess(b, false);
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
      );
    }

    var normalLogin = Column(
      children: [
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
                          text: "*", style: TextStyle(color: Color(0xFFC30052)))
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
                            borderSide:
                                const BorderSide(color: Color(0xFFFFA700)))),
                  )),
                ),
                const SizedBox(
                  height: 4,
                ),

                const SizedBox(
                  height: 16,
                ),
                //Password
                passwordForm,

                loginButton(false),
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
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
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
                        fontFamily: "poppins", color: Color(0xFFFFA700))))
          ],
        )),
      ],
    );
    var fingerLogin = Column(
      children: [
        Row(
          children: [
            Image.asset("assets/images/userAvatar.png"),
            const SizedBox(width: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Xin chào,",
                  style: TextStyle(
                      color: Color(0xff929292),
                      fontFamily: 'roboto',
                      fontSize: 14),
                ),
                FutureBuilder<dynamic>(
                  future: _loadSavedString('UserName'),
                  builder: (context, snapshot) {
                    if (snapshot.data == null || snapshot.data.isEmpty) {
                      return const Text(
                        "Người dùng khách",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                            fontFamily: 'roboto',
                            fontSize: 24),
                      );
                    }
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000),
                            fontFamily: 'roboto',
                            fontSize: 24),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        passwordForm,
        loginButton(true),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 17),
          child: const Text(
            "hoặc đăng nhập với",
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'roboto',
                fontWeight: FontWeight.w400,
                color: Color(0xff929292)),
          ),
        ),
        GestureDetector(
          onTap: _onTouch,
          child: Image.asset('assets/images/touchID.png'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: (() {
                setState(() {
                  _passController.clear;
                  _normalLoginForced = true;
                });
              }),
              child: const Text("Đăng nhập",
                  style: TextStyle(
                      fontFamily: 'roboto',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFFFA700))),
            ),
            const Text.rich(TextSpan(
                style: TextStyle(
                    fontFamily: 'roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff929292)),
                children: [TextSpan(text: "với tài khoản khác")]))
          ],
        ),
      ],
    );
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
                // if (_getInitialValue() == true) normalLogin,
                // if (_getInitialValue() != true) fingerLogin,
                _normalLoginForced == false
                    ? FutureBuilder(
                        future: _isUserEmailEmpty(),
                        builder: (context, snapshot) {
                          if (snapshot.data == true) {
                            return normalLogin;
                          } else {
                            return fingerLogin;
                          }
                        },
                      )
                    : normalLogin
              ],
            ),
          )
        ]));
  }

  void _onTouch() async {
    _getInitialValue().then((value) async {
      if (value == true) {
        await _authenticateWithBiometrics();
        if (_authorized == "Authorized") {
          _loginProcess(true, true);
        }
      }
    });
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
          print('---------- $isChecked');
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
                      print('---------- $isChecked');
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

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
