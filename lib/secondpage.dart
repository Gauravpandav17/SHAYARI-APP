import 'package:flutter/material.dart';
import 'package:shayri/threepage.dart';

import 'storagedata.dart';

class secondpage extends StatefulWidget {
int indexx;
secondpage(this.indexx);
  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {

  List temp = [""];
  @override
  Widget build(BuildContext context) {
    if(widget.indexx==0)
    {
      temp=Data.Love;
    }
    else if(widget.indexx==1)
    {
      temp=Data.Dosti;
    }
    else if(widget.indexx==2)
      {
        temp=Data.Birthday;
      }
    else if(widget.indexx==3)
    {
      temp=Data.Morning;
    }
    else if(widget.indexx==4)
    {
      temp=Data.Alone;
    }
    else if(widget.indexx==5)
    {
      temp=Data.Sad;
    }
    else if(widget.indexx==6)
    {
      temp=Data.Brother;
    }
    else if(widget.indexx==7)
    {
      temp=Data.Angry;
    }


    return Scaffold(appBar: AppBar(leading: InkWell(onTap: () {
      Navigator.pop(context);
    }, child: Icon(Icons.keyboard_backspace)),)
      ,body: ListView.builder(itemCount: temp.length,itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return threepagee(index,temp);
          },));

        },
        tileColor: Colors.amberAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),side: BorderSide(color: Colors.black)),
        title: Text("${temp[index]}",maxLines: 1,),),
      );

    },),);
  }
}
