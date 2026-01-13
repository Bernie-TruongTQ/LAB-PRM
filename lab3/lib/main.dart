import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

void main() async {
  print('--- Exercise 1 ---');
  await exercise1();

  print('\n--- Exercise 2 ---');
  await exercise2();

  print('\n--- Exercise 3 ---');
  exercise3();

  print('\n--- Exercise 4 ---');
  await exercise4();

  print('\n--- Exercise 5 ---');
  exercise5();
}

/// Exercise 5 – Factory Constructors & Cache
class Settings {
  static final Settings _instance = Settings._internal();

  Settings._internal();

  factory Settings() {
    return _instance;
  }
}

void exercise5() {
  final a = Settings();
  final b = Settings();

  print(identical(a, b));
}

/// Exercise 4 – Stream Transformation
Future<void> exercise4() async {
  final stream = Stream.fromIterable([
    1,
    2,
    3,
    4,
    5,
  ]).map((x) => x * x).where((x) => x.isEven);

  await for (final value in stream) {
    print(value);
  }
}

///  Exercise 3 – Async + Microtask Debugging
void exercise3() {
  print('Start');

  scheduleMicrotask(() {
    print('Microtask');
  });

  Future(() {
    print('Event');
  });

  print('End');
}

/// Exercise 2 – User Repository with JSON
class User {
  final String name;
  final String email;

  User(this.name, this.email);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'], json['email']);
  }

  @override
  String toString() {
    return 'User{name: $name, email: $email}';
  }
}

Future<List<User>> fetchUsers() async {
  await Future.delayed(Duration(milliseconds: 300));

  final jsonString = '''
  [
    {"name": "Alice", "email": "alice@test.com"},
    {"name": "Bob", "email": "bob@test.com"}
  ]
  ''';

  final List decoded = jsonDecode(jsonString);
  return decoded.map((e) => User.fromJson(e)).toList();
}

Future<void> exercise2() async {
  final users = await fetchUsers();
  users.forEach(print);
}

/// Exercise 1 - Product Model & Repository
class Product {
  final int id;
  final String name;
  final double price;

  Product(this.id, this.name, this.price);

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price}';
  }
}

class ProductRepository {
  final List<Product> _products = [];
  final StreamController<Product> _controller =
      StreamController<Product>.broadcast();

  Future<List<Product>> getAll() async {
    await Future.delayed(Duration(milliseconds: 300));
    return _products;
  }

  Stream<Product> liveAdded() => _controller.stream;

  void add(Product product) {
    _products.add(product);
    _controller.add(product);
  }
}

Future<void> exercise1() async {
  final repo = ProductRepository();

  repo.liveAdded().listen((p) {
    print(('Stream received: $p'));
  });

  repo.add(Product(1, 'Laptop', 1500));
  repo.add(Product(2, 'Mouse', 25));

  final allProducts = await repo.getAll();
  print('Future result: $allProducts');
}
