import 'package:gsheets/gsheets.dart';
import 'package:misc/user_fields.dart';

class UserSheetsAPI {
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "root-augury-372015",
  "private_key_id": "6cd40bf4bd2568e0d013c87566a8754aa9c7f3b1",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDnQx65enKckJCF\nxz1bF0YLzLOLzkP2+QGtZ6soNM76BAyk/7XjsJJ/ft1mXyDKuzwMHqwMwwlxQpEK\n/fh5Ydg9C0eIv2ddmY5SHATqIQ6c1ZGEqlVhoXuNJEJkOZV0IIs9jM83/mgSMfkN\nsTLLX2lF3MBgKAOupU6GSnEqYN6VMaesJlWivrEUsaI8TSUlDctI1hpwOe8PbB5k\n/uw7oE5dnOpdlmoy0M6RizRJOjTgizihZmK0CJWuwkdn25ihwR9Fe2R5cWJH1cX4\nuUdPe1CRF5WjudS/w6HOR7tG9pJFc+XzLAmOY8GQzd/ELufNketqE3fHc2UZE1Ky\n9+nwkckpAgMBAAECggEAAZAl8zkRRimMJS//rt+5RYTlN/DlgMlgfNEuWlkXXDVT\ntw1IknuGlUtF7eZUc3OrcBsId2py5BkKtS1FL8qCIpvSsylKW/BON+lF0hB2DR1n\nQdiWDLusTmZ0IZc0jAUuH7+Vr8zocUAKd9suiv/v90I1gCjhE9NSSgIojJG8oLuY\nBRaoj1XDrFDeJIgOwpmq0mYkDuwiUS6cR0nq9mgn0HSoNcjHmLCGm7lwB3GzFmqs\nK9tFPBc2xmFqiDbpWd6zot8UwhwfOxcbt5cmol3IUl34gsHKYAedxcIv1G7/0J3S\nx80l1BW948SHdmO0ZxJdtojjD6mAJ5f/gTwfbm54oQKBgQD6sK5hU1RQGV+KNIjy\nN1VwGDjuPJuwUtsVMfqURM1ydoHtFrF0yE3anZfquePQfXjVx//DuvPyV6Mmg9H/\njpdcJ2Y2D5acH+0QdOoaMin6nnDr2zooQtX/ELzhxum4tNLa2avtXGNxdJKxhqbo\nc7glP5Qub7gbKbxLIu2G9jJLIQKBgQDsKRgsLkk3G4RNNdAeasOZQVjt2D3nq99Y\nMYfrOLZEnOG59SWcjXpgb4FJxdHoKSDU7Qk7bp+KN8dbebTYRJ48cOofZbWvkOu7\n7QVlZ6FRn4x2Q4VBoE645QKAt8yORT/XeJyeYnV0ieSAkg23YhNOcmRbcmzePY/B\nIxMgzCWFCQKBgAFVwYf5JqDKkcytnPEVRFo1dtAl+HpG5q3FN11kxGdQpD57+XPy\nwR9h6XYxiToKAQO6be0/6J6owtCosQyYWMv/1baB/L5WGTAWP0zmaXzRLS7EWxnt\nyS/zid317jayl9DcieLYtBrdkQ5q9iaUvy1LmmFo7OUQItWPmQ4372qhAoGBAJ82\nSUSn49ZSJ8zB5dBL3Bh7NNAMxBdnCQj1Q5PyRPdW6NssibHUs9dF9VzeD9i7uZWz\nRFEcEFTnq/BgyeovwJow6bZHJMj7I+IrNkMaLWjQ7qpgdPs8bzY5tok+4Jpd11+V\nwckJyfPKbxG65aJnbWqqtjvslbbyu/LSibfHyde5AoGAZsyDRwG3QH3MMbAWD3PQ\nP1BbeqiHCyc9LzP+Xat4Qd2p2e+pmq2GxVL/9isT9FV3dJWY4s+8HCvVBmxUidU/\nf4hqMtix6lXFqUK5QHBv7Kyu4dThRRgX356btu0rEn1Nr17lN2/7OZxVqhi0mh5l\n2vG91OisKBnXHWOkxmUDA6U=\n-----END PRIVATE KEY-----\n",
  "client_email": "misc-acc@root-augury-372015.iam.gserviceaccount.com",
  "client_id": "110006342211307300498",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/misc-acc%40root-augury-372015.iam.gserviceaccount.com"
}
  ''';
  static final _spreadsheetId = '18DSeYiaWN6q0pCD8TAB8aNKQp9PSDas_-RxUzyFbqHA';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'Jupiter');
    final firstRow = UserFields.getFields();
    _userSheet!.values.insertRow(1, firstRow);
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    return spreadsheet.worksheetByTitle(title)!;
  }
}
