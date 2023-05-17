enum Flavor { develop, prod }

class BuildFlavor {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.develop:
        return 'D&D App';
      case Flavor.prod:
        return 'D&D App';

      default:
        return 'D&D App';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.develop:
        return '';
      case Flavor.prod:
        return '';
      default:
        return '';
    }
  }
}