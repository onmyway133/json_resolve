
# json resolve

## Description
json_resolve is a Dart library that helps accessing property in deep json object easily using keypath

Given the following deeply nested json

```json
{
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
        "weapon": "Mjolnir",
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
}
```

We can access using keypath. The library ensures safe type checking and casting, and use provided default value as last resort

```dart
final String byProperty = resolve(json: json, path: "movie", defaultValue: "error");
expect(byProperty, "isFun");

final int byInt = resolve(json: json, path: "earth", defaultValue: 0);
expect(byInt, 199999);

final String byIndex = resolve(json: json, path: "dc.2.name", defaultValue: "error");
expect(byIndex, "Wonder Woman");

final String byIndexThenProperty = resolve(json: json, path: "marvel.0.appear.1.title", defaultValue: "error");
expect(byIndexThenProperty, "The Dark World");
```

## Installation
First of all add the following dependencies to your `pubspec.yaml`:

```
dependencies:
  json_resolve: ^1.0.0
```

## Author

Khoa Pham, onmyway133@gmail.com

## License

**json_resolve** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/json_resolve/blob/master/LICENSE) file for more info.