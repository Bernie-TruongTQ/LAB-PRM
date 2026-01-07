import 'package:flutter/material.dart';

void main() {
  // Exercise 1 – Basic Syntax & Data Types
  exercise1();
  // Exercise 2 – Collections & Operators
  exercise2();
  // Exercise 3 – Control Flow & Functions
  exercise3();
  // Exercise 4 – Intro to OOP
  exercise4();
  // Exercise 5 – Async, Future, Null Safety & Streams
  exercise5();
}

// 1) async function using Future + await
Future<String> loadData() async {
  // 2) simulate loading
  await Future.delayed(Duration(seconds: 1));
  return "Loaded data successfully";
}

Stream<int> makeNumberStream() async* {
  // 4) simple Stream of integers
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(milliseconds: 200));
    yield i;
  }
}

Future<void> exercise5() async {
  // async/await
  print("Start loading...");
  String result = await loadData();
  print(result);
  print("Loading done.");

  // 3) null-safety operators (?, ??, !)
  String? maybeName; // nullable
  print("maybeName is null: $maybeName");

  // ?? provides default when null
  String displayName = maybeName ?? "Guest";
  print("displayName (??): $displayName");

  // ? safe access
  int? nameLength = maybeName?.length;
  print("maybeName?.length: $nameLength");

  // ! assert non-null (only use when you are sure it's not null)
  maybeName = "Truong";
  int forcedLength = maybeName!.length;
  print("maybeName!.length after assigning: $forcedLength");

  // Stream listen
  print("Stream start:");
  await for (final value in makeNumberStream()) {
    print("Stream value: $value");
  }
  print("Stream end.");
}

class Car {
  String brand;

  Car(this.brand);

  Car.unknown() : brand = "Unknown";

  String drive() {
    return "Car $brand is driving.";
  }
}

class ElectricCar extends Car {
  int batteryPercent;

  ElectricCar(super.brand, this.batteryPercent);

  // Override method
  @override
  String drive() {
    return "ElectricCar $brand is driving silently. Battery: $batteryPercent%";
  }
}

void exercise4() {
  Car car1 = Car("Toyota");
  Car car2 = Car.unknown();
  ElectricCar tesla = ElectricCar("Tesla", 80);

  print(car1.drive());
  print(car2.drive());
  print(tesla.drive());
}

void exercise3() {
  // 1) if/else to check score
  int score = 76;
  if (score >= 90) {
    print("Score $score: A");
  } else if (score >= 80) {
    print("Score $score: B");
  } else if (score >= 70) {
    print("Score $score: C");
  } else if (score >= 60) {
    print("Score $score: D");
  } else {
    print("Score $score: F");
  }

  // 2) switch case for day of week
  int day = 3;
  switch (day) {
    case 2:
      print("Day $day: Monday");
      break;
    case 3:
      print("Day $day: Tuesday");
      break;
    case 4:
      print("Day $day: Wednesday");
      break;
    case 5:
      print("Day $day: Thursday");
      break;
    case 6:
      print("Day $day: Friday");
      break;
    case 7:
      print("Day $day: Saturday");
      break;
    case 8:
      print("Day $day: Sunday");
      break;
    default:
      print("Invalid day");
  }
  // 3) loops through a collection
  List<String> items = ["pen", "book", "laptop"];

  for (int i = 0; i < items.length; i++) {
    print("for: items[$i] = ${items[i]}");
  }

  for (final item in items) {
    print("for-in: $item");
  }

  items.forEach((item) {
    print("forEach: $item");
  });

  int add(int x, int y) {
    return x + y;
  }

  int multiply(int x, int y) => x * y;

  print("add(5, 6) = ${add(5, 6)}");
  print("multiply(5, 6) = ${multiply(5, 6)}");
}

void exercise2() {
  // 1) List of integers
  List<int> numbers = [2, 4, 6, 8, 10];
  print("Original List: $numbers");
  // 2) Arithmetic & comparison operators
  int a = 7, b = 3;
  int sum = a + b;
  int diff = a - b;
  bool equalCheck = (a == b);
  bool logicCheck = (a > b) && (sum > 5);

  print("a=$a, b=$b");
  print("a + b = $sum");
  print("a - b = $diff");
  print("a == b ? $equalCheck");
  print("(a > b) && (sum > 5) ? $logicCheck");

  String compareText = (a > b) && (sum > 5)
      ? "a is greater"
      : "a is not greater";
  print(compareText);
  // 3) Set (unique values)
  Set<String> fruits = {"apple", "banana", "apple"};
  print("Set (unique): $fruits");
  fruits.add("orange");
  fruits.remove("banana");
  print("After add/remove: $fruits");
  // 4) Map (key-value) and Map access + update
  Map<String, int> scores = {"Alice": 85, "Bob": 90};
  print("Map: $scores");

  print("Alice score: ${scores["Alice"]}");
  scores["Alice"] = 95;
  scores["Charlie"] = 88;
  print("Updated map: $scores");
}

void exercise1() {
  int age = 99;
  double gpa = 9.99;
  String name = "Bernie";
  bool isStudent = true;

  print(age);
  print(gpa);
  print(name);
  print(isStudent);

  print("Next Year: ${age + 1}");
}
