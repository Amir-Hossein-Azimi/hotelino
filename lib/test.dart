import 'dart:io';

void main() async {
  await Future.wait([khord(), ab()]);
  print("khord shod , ab josh shod");
  await servKardan();
  print("ghahve serve shod");
}

Future<void> khord() {
  return Future.delayed(Duration(seconds: 3));
}

Future<void> ab() {
  return Future.delayed(Duration(seconds: 2));
}

Future<void> servKardan() {
  return Future.delayed(Duration(seconds: 1));
}
