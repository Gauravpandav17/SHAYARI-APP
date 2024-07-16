import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri/fourthpage.dart';

class threepagee extends StatefulWidget {
  List count = [];
  int index3;
  threepagee(this.index3,this.count);

  @override
  State<threepagee> createState() => _threepageeState();
}

class _threepageeState extends State<threepagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white,),
            child: Center(
              child: Text(
                "${widget.count[widget.index3]}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 50),
              ),
            ),
          )),
          Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    Share.share("${widget.count[widget.index3]}");
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  },
                  icon: Icon(
                    CupertinoIcons.share,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    if (widget.index3 > 0) {
                      widget.index3--;
                      setState(() {});
                    }
                  },
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                  ),
                ),
              ),
              Expanded(
                child: IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return fourthpage(widget.count,widget.index3);
                  },));
                }, icon: Icon(CupertinoIcons.eyedropper)),
              ),
              Expanded(
                child: IconButton(
                    onPressed: () {
                      if (widget.index3 < widget.count.length - 1) {
                        widget.index3++;
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      CupertinoIcons.arrow_right,
                      color: Colors.black,
                    )),
              ),
              Expanded(
                child: IconButton(onPressed: () {

                  Clipboard.setData(ClipboardData(text:  "${widget.count[widget.index3]}"));
                }, icon: Icon(CupertinoIcons.collections)),
              ),


            ],
          )
        ],
      ),
    );
  }
}
