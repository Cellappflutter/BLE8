import 'dart:convert';
import 'dart:io';


import 'package:SmartPalikaBLEResults/model/model.dart';
import 'package:http/http.dart';

class Apiresult {
  String baseurl = "https://grade8.smartpalika.org/api/get-result";
  Future<Studentdata> getresult(String symbol_no, dob) async {
    Response response = await post(baseurl,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
        },
        body: jsonEncode({'symbol_no': symbol_no, 'dob': dob}));
    print(response.statusCode);
    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      
      Studentdata posts = Studentdata.fromJson(body);

      return posts;
    } else {
        dynamic body = jsonDecode(response.body);
        print(body);
       Studentdata posts = Studentdata.fromJson(body);

       return posts;
    }
  }

Future<Nagarpalikaname> getnames() async{
  Response response = await get(baseurl) ;
  if (response.statusCode == 200){
    dynamic body = jsonDecode(response.body);
    Nagarpalikaname nagar = Nagarpalikaname.fromJson(body);
    return nagar;
  }
  else{

  }
}
}
