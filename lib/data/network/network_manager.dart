import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkManager {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  Future<dynamic> post(String url, Map<String, dynamic> data) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));

    // 필요한 헤더 설정
    request.headers.addAll(headers);

    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    try {
      final response = await request.send();

      final responseStream = await response.stream.bytesToString();
      print("서버 응답: $responseStream");

      if (response.statusCode == 201) {
        return json.decode(responseStream);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("오류 발생: $e");
      throw Exception('Failed to load data');
    }
  }
}
