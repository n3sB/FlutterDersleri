import 'package:dinamik_ortalama_hesapla/constant/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';

import '../model/ders.dart';

class DersListesi extends StatelessWidget {
  final Function onDismiss;
  const DersListesi({required this.onDismiss, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri} Kredi, Not değeri ${tumDersler[index].harfDegeri}"),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text((tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0)),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: DataHelper.tumEklenenDersler.length,
          )
        : Center(
            child: Text(
              "Listelemek İstediğiniz Dersi Giriniz",
              style: Sabitler.baslikStyle,
            ),
          );
  }
}
