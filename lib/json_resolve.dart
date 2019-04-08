T resolve<T>({Map<String, dynamic> json, String path, T defaultValue}) {
  try {
    dynamic current = json;
    path.split('.').forEach((segment) {
      final maybeInt = int.tryParse(segment);

      if (maybeInt != null && current is List<dynamic>) {
        current = current[maybeInt];
      } else if (current is Map<String, dynamic> ) {
        current = current[segment];
      }
    });

    return (current as T) ?? defaultValue;
  } catch(error) {
    print(error);
    return defaultValue;
  }
}