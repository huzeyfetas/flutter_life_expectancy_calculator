import 'package:beklenen_yasam_suresi/result.dart';
import 'package:beklenen_yasam_suresi/userData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'genderIcon.dart';
import 'myContainer.dart';

class InputPage extends StatefulWidget {
  static const String routhName = '/';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double yapilanSporunGunSayisi = 0.0;
  double sigaraAdet = 0.0;
  int boy = 170;
  int kilo = 70;
  String seciliCinsiyet;

  /*var navParams = [
    sigaraAdet,
    yapilanSporunGunSayisi,
    boy,
    kilo,
    seciliCinsiyet
  ];*/

  Column buildOutlinedButton(String title, int param) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Text(
              title == 'BOY' ? boy.toString() : kilo.toString(),
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {
                setState(() {
                  title == 'BOY' ? boy-- : kilo--;
                });
              },
              child: Icon(
                FontAwesomeIcons.minus,
                size: 12,
              ),
            ),
            OutlinedButton(
              onPressed: () {
                setState(() {
                  title == 'BOY' ? boy++ : kilo++;
                });
              },
              child: Icon(
                FontAwesomeIcons.plus,
                size: 12,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Yaşam Beklentisi".toUpperCase(),
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyWidget(
                    child: buildOutlinedButton("BOY", boy),
                  ),
                ),
                Expanded(
                  child: MyWidget(
                    child: buildOutlinedButton("KİLO", kilo),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: MyWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Haftada Kaç gün spor yapıyorsunuz ?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    yapilanSporunGunSayisi.toInt().toString(),
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Slider(
                    onChanged: (double gunSayisi) {
                      setState(() {
                        yapilanSporunGunSayisi = gunSayisi;
                      });
                    },
                    min: 0,
                    max: 7,
                    value: yapilanSporunGunSayisi,
                    label: '${yapilanSporunGunSayisi.toInt()}',
                    divisions: 7,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: MyWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Günde kaç sigara tüketiyorsunuz ?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    sigaraAdet == 0.0 ? '0' : sigaraAdet.toInt().toString(),
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Slider(
                    onChanged: (double sigaraSayisi) {
                      setState(() {
                        sigaraAdet = sigaraSayisi;
                      });
                    },
                    min: 0,
                    max: 40,
                    value: sigaraAdet,
                    divisions: 40,
                    label: '${sigaraAdet.toInt()}',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyWidget(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? Colors.red[200]
                        : Colors.grey[400],
                    child: GestureDetector(
                      child: Gender(
                        gender: 'KADIN',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MyWidget(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? Colors.blue[200]
                        : Colors.grey[400],
                    child: Gender(
                      icon: FontAwesomeIcons.mars,
                      gender: 'ERKEK',
                      //icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: ButtonTheme(
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Result.routhName,
                      arguments: UserData(
                        boy: boy,
                        kilo: kilo,
                        sigaraAdet: sigaraAdet,
                        yapilanSporunGunSayisi: yapilanSporunGunSayisi,
                        seciliCinsiyet: seciliCinsiyet,
                      ));
                },
                child: Text('Hesapla'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  onPrimary: Colors.blue,
                  //textStyle: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
