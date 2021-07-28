
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokeapp/data/Utils/Utils.dart';



class Loading extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final Function callback;
  final int tipo_progress;

  const Loading(
      {Key key,
        this.titleTxt: "",
        this.subTxt: "",
        this.callback,
        this.tipo_progress: Constantes.CODE_PROGRESS_BUSCANDO})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    AnimationController _controllerLottie;
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom : 10),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: Lottie.asset(
                  tipo_progress == Constantes.CODE_PROGRESS_NO_RESULTS ? 'assets/lottie/empty.json' : 'assets/lottie/pikachu.json',
                  controller : _controllerLottie,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom : 10),
                  child: Center( child : Text( titleTxt != null ? titleTxt : "-", style : TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700 )) )
              ),
              Center( child :tipo_progress == Constantes.CODE_PROGRESS_NO_RESULTS ? Container(
                  margin: EdgeInsets.only(top: 13, left : 13, right: 13, bottom: 13),
                  width: MediaQuery.of(context).size.width * .8,
                  child: FlatButton(
                    onPressed: ()=> callback,
                    child: FittedBox(fit:BoxFit.fitWidth,
                        child: Text("Actualizar") ),
                    textColor: Colors.white,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  )
              ) : SizedBox(),
              ),
            ]
        )
    );

  }
}
