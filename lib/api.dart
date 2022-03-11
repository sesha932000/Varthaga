import 'dart:developer';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CallApi{
final String _url="http://www.varthaga.com/api/register";

postData(data, String) async {
var fulUrl=_url;
   return  http.post(Uri.parse(fulUrl),
      headers: _setHeaders(),
  body: jsonEncode(data),
  );
}

_setHeaders()=>{
  'Content-type':'application/json',
  'Accept':'application/json',
};
}