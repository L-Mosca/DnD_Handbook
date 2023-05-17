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
        return 'https://www.dnd5eapi.co/';
      case Flavor.prod:
        return 'https://www.dnd5eapi.co/';
      default:
        return 'https://www.dnd5eapi.co/';
    }
  }
}