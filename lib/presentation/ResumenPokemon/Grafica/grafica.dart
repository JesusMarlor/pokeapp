import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Grafica extends StatelessWidget {
  const Grafica({
    Key key,
    this.lista,
    this.onTap,
    this.color
  }) : super(key: key);

  final List<Map<String,dynamic>> lista;
  final Function onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color,
                ),
                height: ( MediaQuery.of(context).size.height * ( lista[index]["base_stat"] != 0 ? lista[index]["base_stat"] / 100 : 0 ) ) *.13,
              ),
              Container(
                width : 50,
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                        child: Text(lista[index]["stat"]["name"].toUpperCase(), style: TextStyle( fontSize: 10)))
                  ],
                ),
              )
          ],);
        }
    );
  }

}