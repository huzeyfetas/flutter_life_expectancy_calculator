import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'genderIcon.dart';
import 'myContainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double sigaraAdet = 0.0;
  double yapilanSporunGunSayisi = 0.0;
  int boy = 170;
  int kilo = 70;

  String seciliCinsiyet;

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
                    value: yapilanSporunGunSayisi,
                    onChanged: (double gunSayisi) {
                      setState(() {
                        yapilanSporunGunSayisi = gunSayisi;
                      });
                    },
                    min: 0,
                    max: 7,
                    label: '${yapilanSporunGunSayisi.toInt()}',
                    divisions: 7,
                  )
                ],
              ),
            ),
          ),
          Expanded(
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
                    onChanged: (double value) {
                      setState(() {
                        sigaraAdet = value;
                      });
                    },
                    value: sigaraAdet,
                    min: 0,
                    max: 40,
                    divisions: 40,
                    label: '${sigaraAdet.toInt()}',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
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
        ],
      ),
    );
  }
}
