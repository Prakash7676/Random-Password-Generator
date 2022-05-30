import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Random Password Generator",
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Random Password Generator'),
          ),
          body: const MyAppBody())));
}

class MyAppBody extends StatefulWidget {
  const MyAppBody({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppBody> createState() => _MyAppBodyState();
}

class _MyAppBodyState extends State<MyAppBody> {
  TextEditingController c = TextEditingController();
  String randomPassword = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Enter No Length',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: c,
            decoration: const InputDecoration(
              labelText: "Enter No of Length",
              hintText: "For E.g. 8",
            ),
          ),
          Text(
            'Random Password is:\n$randomPassword',
            style: const TextStyle(fontSize: 20),
          ),
          MaterialButton(
            child: const Text(
              'Generate',
            ),
            onPressed: () {
              if (c.text.isNotEmpty) {
                String randomPass =
                    randomPassGenerator(length: int.parse(c.text));
                setState(() {
                  randomPassword = randomPass;
                });
              }
/*         //or
               String randomPass =
              randomPassGenerator(length: int.parse(c.text));
              setState(() {
                randomPassword = randomPass;
              });
              */
            },
          )
        ],
      ),
    );
  }
}

// Create Random Password Generator Using [4 Min]
String randomPassGenerator({int? length}) {
  var alhpabets = ['a', 'b', 'c', 'd', 'e', 'f'];
  var alphabetsC = ['A', 'B', 'C', 'D', 'E', 'F'];
  var neumeric = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  var symbols = ['_', '#', '%', '\$', ','];
  String randomPassword = "";
  var allitems = [...alhpabets, ...alphabetsC, ...neumeric, ...symbols];
  allitems.shuffle();

  for (int i = 0; i < length!; i++) {
    if (length > allitems.length) {
      break;
    }
    randomPassword += allitems[i].toString();
  }
  return randomPassword;
}
