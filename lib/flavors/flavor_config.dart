enum Flavor {
  development,
  production,
}

class FlavorConfig {
  final Flavor flavor;
  final String appName;

  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required String appName,
  }) {
    _instance ??= FlavorConfig._internal(flavor, appName);
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.appName);

  static FlavorConfig get instance => _instance!;
  static bool isDevelopment() => _instance?.flavor == Flavor.development;
  static bool isProduction() => _instance?.flavor == Flavor.production;
}
