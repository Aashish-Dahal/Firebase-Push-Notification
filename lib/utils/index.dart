import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<String?> downloadFile(String? Url, String filename) async {
  if (Url != null) {
    final directory = await getApplicationSupportDirectory();

    final filepath = '${directory.path}/$filename';
    final response = await http.get(Uri.parse(Url));
    final file = File(filepath);
    await file.writeAsBytes(response.bodyBytes);
    return filepath;
  } else {
    return null;
  }
}
