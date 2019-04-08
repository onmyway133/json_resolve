///
/// json_resolve
/// Created by Khoa Pham
///

import 'package:flutter_test/flutter_test.dart';
import 'package:json_resolve/json_resolve.dart';

void main() {
  final Map<String, dynamic> json = {
    "movie": "isFun",
    "earth": 199999,
    "dc": [
      {
        "name": "Superman"
      },
      {
        "name": "Flash"
      },
      {
        "name": "Wonder Woman"
      }
    ],
    "marvel": [
      {
        "name": "Thor",
        "weapon": "Hammer",
        "appear": [
          {
            "year": 2011,
            "title": "Thor"
          },
          {
            "year": 2013,
            "title": "The Dark World"
          },
          {
            "year": 2017,
            "title": "Ragnarok"
          }
        ]
      }
    ]
  };

  test('resolve', () {
    final String byProperty = resolve(json: json, path: "movie", defaultValue: "error");
    expect(byProperty, "isFun");

    final int byInt = resolve(json: json, path: "earth", defaultValue: 0);
    expect(byInt, 199999);

    final String byIndex = resolve(json: json, path: "dc.2", defaultValue: "error");
    expect(byIndex, "Wonder Woman");

    final String byIndexThenProperty = resolve(json: json, path: "marvel.appear.1.title", defaultValue: "error");
    expect(byIndexThenProperty, "The Dark World");
  });

  test("wrong type", () {
    final int byInt = resolve(json: json, path: "marvel.0.name", defaultValue: 999);
    expect(byInt, 999);
  });

  test("not found", () {
    final String byString = resolve(json: json, path: "marvel.0.skill", defaultValue: "error");
    expect(byString, "error");
  });
}