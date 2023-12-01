import 'package:translator/translator.dart';

 Future<String> TxtTranslate(String txt) async{
  if(true){
    String _txt='d';
    final translator = GoogleTranslator();
      var t = await translator.translate(txt, to: 'hi');
      _txt = t.text;
    print(_txt);
    return  _txt;
  }
  else{
    return txt;
  }
}