import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsRepository {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void setCustomLog() async {
    analytics.logEvent(
      name: 'Log Test',
      parameters: {'nome': 'Log Para Teste'},
    );
  }

  void setUserProperties() async {
    analytics.setUserProperty(
        name: 'Nome_de_Usuario', value: 'Valor do Usuario');
  }

  void setCurrentScreen() {
    analytics.setCurrentScreen(
        screenName: 'Nome da Tela',
        screenClassOverride: 'Nome da classe da tela');
  }
}
