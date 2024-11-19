import 'package:flutter/material.dart';
import 'package:urunler_app/data/entity/urunler.dart';

class Detaysayfa extends StatefulWidget {
  urunler urun;

  Detaysayfa({required this.urun});

  @override
  State<Detaysayfa> createState() => _DetaysayfaState();
}

class _DetaysayfaState extends State<Detaysayfa> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(widget.urun.ad),),
      body:Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${widget.urun.resim}"),

            Text("${widget.urun.fiyat}TL",style:const TextStyle(fontSize: 50) ,),
          ],
        ),
      ),
    );
  }
}
