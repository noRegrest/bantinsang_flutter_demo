// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String _savedString = '';
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _ChooseController = TextEditingController();
  final TextEditingController _TypeController = TextEditingController();
  @override

  // Load the saved string from Shared Preferences
  _loadSavedString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedString = prefs.getString(key) ?? '';
    });
  }

  // Save the string to Shared Preferences
  _saveString(String key, String str) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, str.trim());
  }

  _clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    _showAllPreferences();
  }

  Future<void> _deletePreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  _showAllPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    Set<String> keys = prefs.getKeys();
    setState(() {
      _savedString = '';
    });
    for (String key in keys) {
      print('$key: ${prefs.get(key)}');
      setState(() {
        _savedString += '$key: ${prefs.get(key)}\n';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shared Preferences Example'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(25, 30, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Key:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      ))),
                  controller: _TypeController,
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Value:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      ))),
                  controller: _controller,
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Key to value:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                        10,
                      ))),
                  controller: _ChooseController,
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed: () {
                    _saveString(_TypeController.text, _controller.text);
                  },
                  child: const Text('Save String'),
                ),
                ElevatedButton(
                    onPressed: () {
                      _loadSavedString(_ChooseController.text);
                    },
                    child: const Text("Load")),
                ElevatedButton(
                    onPressed: _showAllPreferences,
                    child: const Text("Show all")),
                // ElevatedButton(
                //     onPressed: _deletePreference(_ChooseController.text),
                //     child: const Text("Delete")),
                ElevatedButton(
                    onPressed: () {
                      _clearPreference();
                    },
                    child: const Text("Clear all")),
                const Divider(
                  thickness: 3,
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(_savedString),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    /*return MaterialApp(
        home: Scaffold(
            body: Container(
      margin: const EdgeInsets.fromLTRB(24, 96, 25, 0),
      child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        Row(
          children: [
            const SizedBox(height: 24, width: 24, child: Icon(Icons.abc)),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Xin chào,",
                    style: TextStyle(
                        fontFamily: 'roboto',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff929292))),
                FutureBuilder<dynamic>(
                  future: _loadSavedString('Username'),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return const Text(
                        "Người dùng khách",
                        style: TextStyle(
                            fontFamily: 'roboto',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff000000)),
                      );
                    }
                    if (snapshot.hasData) {
                      return Text(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            )
          ],
        ),
        const Text("Mật khẩu*"),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
          height: 48,
          child: TextFormField(
            decoration: InputDecoration(
                hintText: "password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(6))),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: const [Expanded(child: SizedBox()), Text("Quên mật khẩu")],
        ),
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('data'))),
          ],
        ),
        const Center(child: Text('hoặc đăng nhập với')),
        Center(
          child: GestureDetector(
            onTap: () {

            },
            child: Image.asset("assets/images/touchID.png"),
          ),
        ),
      ])),
    )));
  */
  }
}
