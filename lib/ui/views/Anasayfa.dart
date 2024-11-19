import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urunler_app/ui/views/detaySayfa.dart';

import '../../data/entity/urunler.dart';

class anasayfa extends StatefulWidget {
  const anasayfa({super.key});

  @override
  State<anasayfa> createState() => _anasayfaState();
}

class _anasayfaState extends State<anasayfa> {

  Future<List<urunler>> urunleriYukle()async{
    var urunlerListesi=<urunler>[];

    var u1 =urunler(id: 1, ad: "MacBook Pro 14", resim: "bilgisayar.png", fiyat: 43000);
    var u2 =urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk.png", fiyat: 2500);
    var u3 =urunler(id: 3, ad: "Sonny ZX sERİES", resim: "kulaklik.png", fiyat: 40000);
    var u4 =urunler(id: 4, ad: "Gio Armani", resim: "parfum.png", fiyat: 2000);
    var u5 =urunler(id: 5, ad: "Casio X Series", resim: "saat.png", fiyat: 8000);
    var u6 =urunler(id: 6, ad: "Dyson V8", resim: "supurge.png", fiyat: 18000);
    var u7 =urunler(id: 7, ad: "IPhone 13", resim: "telefon.png", fiyat: 32000);



    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);
    return urunlerListesi;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ürünler"),),
      body: FutureBuilder<List<urunler>>(
      future:urunleriYukle(),
      builder: (context,snapshot){
        if(snapshot.hasData) {
          var urunlerListesi =snapshot.data;
          
          return ListView.builder(
            itemCount: urunlerListesi!.length,
            itemBuilder: (context,index){
              var urun =urunlerListesi[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Detaysayfa(urun: urun)));
                },
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(width: 128,height: 128,
                        child:
                        Image.asset("resimler/${urun.resim}")),
                      ),
                
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(urun.ad),
                          const SizedBox(height: 10,),
                          Text("${urun.fiyat}TL",style:const TextStyle(fontSize: 20) ,),
                          const SizedBox(height: 10,),
                          ElevatedButton(onPressed:(){
                            print("${urun.ad} sepete eklendi");
                          }, child: const Text("Sepete Ekle"),)
                
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }else{
          return const Center();
        }
      },
      ),
    );
  }
}
