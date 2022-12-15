import 'dart:convert';

import 'package:api_integration/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Users users = Users();
  bool isLoading = true;
  void getData() async {
    var url = Uri.parse('https://fluttmac.github.io/api/user.json');
    final response = await http.get(url);
    var json = jsonDecode(response.body);
    setState(() {
      users = Users.fromJson(json);
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  final textStyle = const TextStyle(color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Api Integration'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.teal,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(users.data![index].name!, style: textStyle),
                          Text(users.data![index].profession!,
                              style: textStyle),
                          Text(users.data![index].email!, style: textStyle),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
