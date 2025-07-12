import 'dart:io';

void main() {
khord().then((value) => print("khordKardan ghahve"));
ab().then((value) {
  
 print("josh amadan ab");
 return servKardan().then((value) => print("serve kardan ghahve"));

});
}
Future<void> khord(){
  return Future.delayed(Duration(seconds: 3));
}

Future<void> ab(){
  return Future.delayed(Duration(seconds: 2));
}

Future<void> servKardan(){
  return Future.delayed(Duration(seconds: 1));
}