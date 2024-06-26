import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/core/functions/check_internet.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

final String _basicAuth = "Basic ${base64Encode(utf8.encode("ddddd:sddsdfsdfsdf"))}";
Map<String,String> _myHeaders = {
  "Authorization":_basicAuth,
};
class CRUD{

  Future<Either<StatusRequest,Map>> postData(String url,Map data) async{

     if(await checkInternet()){
       var response = await http.post(Uri.parse(url),body: data);
       print(response.statusCode);
       if(response.statusCode == 200 || response.statusCode == 201){
         var responseBody = jsonDecode(response.body);
         print(responseBody);
         return Right(responseBody);
       }
       else{
         return const Left(StatusRequest.serverFailure);
       }

     }else{
       return const Left(StatusRequest.offlineFailure);
     }
   }
  Future<Either<StatusRequest, Map>> addDataWithImageOne(
      url, data, File? image,
      [String? nameRequest]) async {
    if (nameRequest == null) {
      nameRequest = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myHeaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(nameRequest, stream, length,
          filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myRequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myRequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else {
      return const Left(StatusRequest.serverFailure);
    }
  }




  }


