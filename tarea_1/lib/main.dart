import 'package:flutter/material.dart';

void main() => runApp(const SnackBarDemo());

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mc Flutter Andre'),
        ),
        body: const SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatefulWidget {
  const SnackBarPage({super.key});

  @override
  State<SnackBarPage> createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage> {
  bool tap1 = false;
  bool tap2 = false;
  bool tap3 = false;
  bool tap4 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      height: 140,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(1),
                child: Icon(Icons.account_circle, size: 50),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Flutter McFlutter",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Experienced App Developer",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("123 Main Street", style: TextStyle(fontSize: 15)),
              Text("(123) 4567-8901", style: TextStyle(fontSize: 15))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  iconSize: 30,
                  color: tap1 ? Colors.indigo : Colors.black,
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('Soy una persona!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    tap1 = !tap1;
                    setState(() {});
                  },
                  icon: Icon(Icons.accessibility_new)),
              IconButton(
                  iconSize: 30,
                  color: tap2 ? Colors.indigo : Colors.black,
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('Soy un cronómetro!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    tap2 = !tap2;
                    setState(() {});
                  },
                  icon: Icon(Icons.timer)),
              IconButton(
                  iconSize: 30,
                  color: tap3 ? Colors.indigo : Colors.black,
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('Soy un android!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    tap3 = !tap3;
                    setState(() {});
                  },
                  icon: Icon(Icons.phone_android)),
              IconButton(
                  iconSize: 30,
                  color: tap4 ? Colors.indigo : Colors.black,
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Text('Soy un iPhone!'),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    tap4 = !tap4;
                    setState(() {});
                  },
                  icon: Icon(Icons.phone_iphone)),
            ],
          ),
        ],
      ),
    );
  }
}
