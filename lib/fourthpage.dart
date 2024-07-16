import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class fourthpage extends StatefulWidget {
  List count;
  int index3;

  fourthpage(this.count, this.index3);

  @override
  State<fourthpage> createState() => _fourthpageState();
}

class _fourthpageState extends State<fourthpage> {
  double long = 30;

  List<Color> colorlist = [
    Colors.pink,
    Colors.red,
    Colors.black,
    Colors.yellowAccent,
    Colors.blue,
    Colors.green,
    Colors.white,
    Colors.cyanAccent,
    Colors.grey,
    Colors.purple
  ];

  List<Color> colortext = [
    Colors.pink,
    Colors.red,
    Colors.black,
    Colors.yellowAccent,
    Colors.blue,
    Colors.green,
    Colors.white,
    Colors.cyanAccent,
    Colors.grey,
    Colors.purple
  ];

  Color currentcolor = Colors.white;
  Color currentcolortext = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: currentcolor,
            child: Center(
              child: Text(
                "${widget.count[widget.index3]}",
                style: TextStyle(fontSize: long, color: pickerColor,fontFamily: 'Anton'),
              ),
            ),
          )),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.purpleAccent)),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              height: 80,
                              child: GridView.builder(
                                itemCount: colorlist.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: colorlist.length),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      currentcolor = colorlist[index];
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      color: colorlist[index],
                                      margin: EdgeInsets.all(5),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        "BACK GROUND COLOR",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100,
                              width: double.infinity,
                              child: GridView.builder(
                                itemCount: colortext.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: colortext.length),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      currentcolortext = colortext[index];
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      color: colortext[index],
                                      margin: EdgeInsets.all(5),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Text("TEXT COLOR")),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100,
                              child: StatefulBuilder(builder:  (context, setState1) {
                                return Slider(
                                  min: 10,
                                  max: 60,
                                  value: long,
                                  onChanged: (value) {
                                    setState(() {
                                      setState1(() {
                                        long = value;
                                      });


                                    });
                                  },
                                );
                              },)
                            );
                          },
                        );
                      },
                      child: Text("TEXT SIZE")),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 50,
                              child: Text("",
                                  style: TextStyle(fontFamily: 'Anton')),
                            );
                          },
                        );
                      },
                      child: Text("FONT TYPE")),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: const Text('Pick a color!'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: pickerColor,
                            onColorChanged: changeColor,
                          ),
                          // Use Material color picker:
                          //
                          // child: MaterialPicker(
                          //   pickerColor: pickerColor,
                          //   onColorChanged: changeColor,
                          //   showLabel: true, // only on portrait mode
                          // ),
                          //
                          // Use Block color picker:
                          //
                          // child: BlockPicker(
                          //   pickerColor: currentColor,
                          //   onColorChanged: changeColor,
                          // ),
                          //
                          // child: MultipleChoiceBlockPicker(
                          //   pickerColors: currentColors,
                          //   onColorsChanged: changeColors,
                          // ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Got it'),
                            onPressed: () {
                              setState(() => currentColor = pickerColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );

                    },);
                  }, child: Text("TEXT COLOR")),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(onPressed: () {}, child: Text("BG")),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

}
