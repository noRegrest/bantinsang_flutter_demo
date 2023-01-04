import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

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
  void _onChanged(bool value) {
    _authenticateWithBiometrics();
    setState(() {
      _value = value;
    });
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
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
    /*return MaterialApp(
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
                    child:
                        CupertinoSwitch(value: _value, onChanged: _onChanged)),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Color(0xff929292),
            ),
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
                    onPressed: () {},
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

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
