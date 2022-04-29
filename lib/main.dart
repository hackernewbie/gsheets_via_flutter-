import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';


const _apiCreds   = r'''
{
  "type": "service_account",
  "project_id": "fluttergsheets-348717",
  "private_key_id": "252182d702c54f3f5e6b00d00608567ae35e327a",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCcM9W/wmrb4uZV\nzHl0NqxZizVBavraXeWqy++QyIadoNW5Fc7h7ZHWbpAovFWBw/qb/QDhZO78dUNk\nu0a0fNgjLPduhW7+y0R8v8hKMRZ5GC9mvqHtqicYqkYL8UgTyi3Zu7filAc4z9ef\n9c2HYgkH2cFdeIiFYSz2wNe2InKuc9nke/cUJ4Iy6WG5p1dZUYmcAZKJgnmZPPxM\n3PnCHvI8KjS9Vz0dJhqYNBe07O8X0/5zKdPeeyVcjAqBDqY5nqNrsJdcQWj6tFoy\nJpEeLpNwT1eIBUJr0WDFgc4MiI6mgsZUel3JP2rRA2eNHN6lPduAfHC+xhso1agj\nHeLxGfG/AgMBAAECggEALgzWEl+F02eUUm0izVElBI0W2T9pzyDpia3v5bZIgYYe\nHB/CyzaXzSjxVSEY8FXPt1cigFCaaFFF2hegI6u+qLgkBjBOZc2VVlXP/Zd1MaQg\nrWC8Km4EcrAYUIMEpdjwJYXDE4hijKwxvJXhzuznDqpy6FSVowTgFasKrUaAms9U\nzVmfwnZpl6yA3nu4ktwDHRdRxWPx+C8UuNJHBnjYgsNT//mZASUis02pZUzC6cOx\ne1QG4+lQ67B97wcpD72jqsVQjudSXkdFPZaFZRVcSjrksvycvHQKqXi4w6cQprqK\nOMAWsHBpIuO6fwhukde3YDY4ZRE43oSjZ8p84OU4SQKBgQDPJeAH/yQ7syPETUbY\noUCeJ2Kd9vth4qcmzVZN8k4dMlsRqQtrnGsZneRRDaVvOFWmBmblEktiM0nL82kK\nRaXyyw1hwxC04cD4QQuqVBTrWWCa6VeUmLNBJSJ8Fl2u/yB2HWADwB+S0wO9Sfzj\niKt70g7vqQjPZWQdiwSXCW3LJQKBgQDBCjvHR0fGutaiPxgtOY/rdEVLqthLy+4b\nCNjqNWQC9ERchssVUaODj/NPNOr8gdlUKHp0DU6H2tc+Yy4RagFB1xg22q+NxWAk\nwYcxT865Tnkyz1dH0DgJ5zbP8wQqt4URfJgc//sN99AUb69gN6n0n6jXmj4qJu4G\nSfPliB0GEwKBgDVy4mFt1d2JlXr7LYKL6O5l3y4/IhHZt6NtbA1krf8elRzzbzzu\n+Tt84AKB8OPHt2HFWRtWIxlNfocfYUUDP5RsDCHjgRYLAg2MSwRB+bvYLfMKrkxr\nMiVm/YTjCH002x1e6v1Mv1jVFavrwVK8WvLx+mSgSuOol7J/wkluZ2P5AoGATKFj\nWZhSRfGlgoLJdiqDl1RwrbkEZBJwUwsQEOlg6ktNV+2qcKwX3QIn9Cltnw9s1pu7\nAJbHteaJy5pTj1YlaZ2ZXy0ww3a20+B/anPj/GvKcQEeBMQDeuruN16hKNPxXx+2\nwsxbPRBC6dnsJKX0Mcevnub8Bn+tvZFd4KBH5UECgYAZPhEKTk++7jfvgCubGhl1\ny+aSY9bybZ5vwVpr2U9krN7hjSHVMZ4j/WXjRkdpzrt5braqAC5/6XaRm0YtbUqy\naVdjkI/g8uI5xmY6xNmAFsSB031oLee6IhiB+6efXNVcRGLOuloYvpBJmihvJmRX\nhL0ALhgvyRyizp3BYcalFQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "fluttergsheets@fluttergsheets-348717.iam.gserviceaccount.com",
  "client_id": "108275528245241044281",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/fluttergsheets%40fluttergsheets-348717.iam.gserviceaccount.com"
}
''';

const _sheetID          =   '1dLpu4ZKuMRH-7sHBpzM-qRwOZjLS_B0HCZj41lCDP5A';
const _worksheetName    =   'Sheet1';



void main() async {
  final gSheetObj       = GSheets(_apiCreds);
  final gSheetToUse     = await gSheetObj.spreadsheet(_sheetID);
  final worksheetToUse  = gSheetToUse.worksheetByTitle(_worksheetName);

  await worksheetToUse!.values.insertValue('Hello',column: 1, row: 1);
  await worksheetToUse.values.insertValue('Rajiv',column: 2, row: 1);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}