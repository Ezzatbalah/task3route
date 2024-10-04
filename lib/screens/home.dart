import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final namecontrollar = TextEditingController();
  final numbercontrollar = TextEditingController();
  List<Map<String, String>> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 160, 157, 157),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(
          child: Text(
            "Contant Screen",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: namecontrollar,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Enter your name',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: numbercontrollar,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Enter your name',
                labelStyle: const TextStyle(
                  color: Colors.black,
                ),
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (data.length < 3) {
                        data.add({
                          'name': namecontrollar.text,
                          'number': numbercontrollar.text,
                        });
                        namecontrollar.clear();
                        numbercontrollar.clear();
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(150, 40),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (data.isNotEmpty) {
                      setState(() {
                        data.removeLast();
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: const Size(150, 40),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: data.isNotEmpty,
            child: buildContiner(0),
          ),
          Visibility(
            visible: data.length > 1,
            child: buildContiner(1),
          ),
          Visibility(
            visible: data.length > 2,
            child: buildContiner(2),
          ),
        ],
      ),
    );
  }

  Widget buildContiner(int index) {
    if (index < data.length) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name:${data[index]['name']}"),
                Text("Phone:${data[index]['number']}"),
              ],
            ),
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
