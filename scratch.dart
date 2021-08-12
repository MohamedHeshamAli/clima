import 'dart:io';
import 'package:translator/translator.dart';

void main() async {
  String translation =
      await GoogleTranslator().translate("hi", from: 'ar', to: 'en');
  print(translation);
  // performTasks();
}

void performTasks() async {
  String s = await task2();
  task3(s);
  task1();
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String result;
  await Future.delayed(Duration(seconds: 3), () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String s) {
  String result = 'task 3 data';
  print('Task 3 complete$s');
}
