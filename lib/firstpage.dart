import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shayri/secondpage.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  List cat = [
    "Love",
    "Dosti",
    "Birthday",
    "Morning",
    "Alone",
    "Sad",
    "Brother",
    "Angry"
  ];

  List img = [
    "love.jpg",
    "Dosti.jpg",
    "Birthday.jpg",
    "morning.jpg",
    "alone.jpg",
    "sad1.jpg",
    "brother.jpg",
    "angry.jpg"
  ];



  Future<void> permission() async {
    var status = await Permission.photos.status;
    if (status.isDenied) {

      Permission.photos.request();
    }


  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permission();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: cat.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return secondpage(index);
            },));
          },
            trailing: Icon(Icons.arrow_right),
            tileColor: Colors.pink,
            title: Text("${cat[index]}"),
            leading: Container(height: 100,width: 100,
              decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage("image/${img[index]}")),
              shape: BoxShape.circle),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
         
          ),
        );
      },
    ));
  }
}
