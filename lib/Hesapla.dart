import 'package:beklenen_yasam_suresi/userData.dart';

class Hesapla {
  final UserData _userData;

  Hesapla(this._userData);

  int hesapla() {
    int boy = _userData.boy;
    int kilo = _userData.kilo;
    int sigaraSayisi = _userData.sigaraAdet.toInt();
    int sporSayisi = _userData.yapilanSporunGunSayisi.toInt();
    String cinsiyet = _userData.seciliCinsiyet;

    int sonuc;

    sonuc = 90 - sporSayisi - sigaraSayisi;
    sonuc = sonuc + (boy ~/ kilo).toInt();
    cinsiyet == 'KADIN' ? sonuc += 3 : sonuc = sonuc;

    return sonuc;
  }
}
