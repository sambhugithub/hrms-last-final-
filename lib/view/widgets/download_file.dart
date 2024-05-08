import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';


class DownloadFile{


  Future<String> downloadFile(String url, String fileName, String dir) async {
    HttpClient httpClient = new HttpClient();
    File file;
    String filePath = '';
    String myUrl = '';

    try {
      myUrl = url+'/'+fileName;
      var request = await httpClient.getUrl(Uri.parse(myUrl));
      var response = await request.close();
      print(response.statusCode);
      if(response.statusCode == 200) {
        var bytes = await consolidateHttpClientResponseBytes(response);
        filePath = '$dir/$fileName';
        file = File(filePath);
        await file.writeAsBytes(bytes);
        print('done $filePath');

      }
      else
        filePath = 'Error code: '+response.statusCode.toString();
      print('error');
    }
    catch(ex){
      filePath = 'Can not fetch url';
      print('catche error');
    }

    return filePath;
  }


}