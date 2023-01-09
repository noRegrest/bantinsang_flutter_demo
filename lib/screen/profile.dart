import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/screen/login.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: import_of_legacy_library_into_null_safe

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;
  bool _value = false;

  void _onChanged(bool value) async {
    var username = await _loadSavedString('UserName');
    await _authenticateWithBiometrics();
    if (_authorized == "Authorized") {
      _deleteString('fingerprint_login_null');

      setState(() {
        _value = value;
        print(_value);
      });
      _setValue('fingerprint_login_$username', _value);
    }
  }

  _loadSavedString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  _setValue(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> _getInitialValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var username = await _loadSavedString('UserName');
    return prefs.getBool('fingerprint_login_$username') ?? false;
  }

  _deleteString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  _saveString(String key, String str) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, str);
  }

  _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      // const BottomNaviButtons()),
    );
  }

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
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

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Đặt ngón tay zô quét đi ba',
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
              signInTitle: 'Alo1',
              biometricHint: 'Alo2',
              biometricNotRecognized: "không nhận ra",
              biometricRequiredTitle: "cần",
              biometricSuccess: "cồng thanh",
              cancelButton: "Hủy",
              deviceCredentialsRequiredTitle: "hỏi chấm",
              deviceCredentialsSetupDescription: "hỏi chấm chấm",
              goToSettingsButton: "vào cài đặt",
              goToSettingsDescription: "thông tin cài đặt"),
        ],
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

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_supportState == _SupportState.unknown)
                  const CircularProgressIndicator()
                else if (_supportState == _SupportState.supported)
                  const Text('This device is supported')
                else
                  const Text('This device is not supported'),
                const Divider(height: 100),
                Text('Can check biometrics: $_canCheckBiometrics\n'),
                ElevatedButton(
                  onPressed: _checkBiometrics,
                  child: const Text('Check biometrics'),
                ),
                const Divider(height: 100),
                Text('Available biometrics: $_availableBiometrics\n'),
                ElevatedButton(
                  onPressed: _getAvailableBiometrics,
                  child: const Text('Get available biometrics'),
                ),
                const Divider(height: 100),
                Text('Current State: $_authorized\n'),
                if (_isAuthenticating)
                  ElevatedButton(
                    onPressed: _cancelAuthentication,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Cancel Authentication'),
                        Icon(Icons.cancel),
                      ],
                    ),
                  )
                else
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: _authenticate,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Authenticate'),
                            Icon(Icons.perm_device_information),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _authenticateWithBiometrics,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(_isAuthenticating
                                ? 'Cancel'
                                : 'Authenticate: biometrics only'),
                            const Icon(Icons.fingerprint),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
    */
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.fromLTRB(24, 57, 21, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/images/back.png"),
                const SizedBox(width: 18),
                const Text("Cài đặt",
                    style: TextStyle(
                        color: Color(0xff030323),
                        fontFamily: 'roboto',
                        fontSize: 32,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 23, 16, 0),
                child: const Text("Tài khoản",
                    style: TextStyle(
                        color: Color(0xff030323),
                        fontFamily: 'roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w700))),
            const Divider(
              thickness: 1,
              color: Color(0xff929292),
            ),
            Row(
              children: [
                Image.asset("assets/images/user_folder.png"),
                const SizedBox(width: 21.26),
                const Text("Thông tin cá nhân",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                const Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {},
                    icon: SizedBox(
                        height: 24,
                        width: 24,
                        child: Image.asset(
                            "assets/images/icons8_next_page 1.png"))),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color(0xff929292),
            ),
            Row(
              children: [
                const Icon(Icons.fingerprint),
                const SizedBox(width: 21.26),
                const Text("Đăng nhập vân tay",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
                const Expanded(child: SizedBox()),
                SizedBox(
                    height: 31,
                    width: 51,
                    child: FutureBuilder(
                      future: _getInitialValue(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          _value = snapshot.data ?? false;

                          return CupertinoSwitch(
                              activeColor: const Color(0xff34C759),
                              value: _value,
                              onChanged: _onChanged);
                        } else {
                          return CupertinoSwitch(
                              activeColor: const Color(0xff34C759),
                              trackColor: const Color(0xff4C4C4D),
                              value: _value,
                              onChanged: _onChanged);
                        }
                      },
                    )),
              ],
            ),
/**CupertinoSwitch(
                        activeColor: const Color(0xff34C759),
                        trackColor: const Color(0xff4C4C4D),
                        value: _value,
                        onChanged: _onChanged) */

            const Expanded(child: SizedBox()),
            Row(children: [
              Expanded(
                  child: Container(
                height: 50,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xffFFA700))),
                    onPressed: _logOut,
                    child: const Text("Đăng xuất",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: 'roboto',
                            fontSize: 16,
                            fontWeight: FontWeight.w700))),
              ))
            ]),
            const SizedBox(
              height: 15,
            ),
            const Center(
                child: Text("Phiên bản 1.0.1",
                    style: TextStyle(
                        color: Color(0xff929292),
                        fontFamily: 'roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w400))),
            const SizedBox(
              height: 21,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNaviButtons(),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
