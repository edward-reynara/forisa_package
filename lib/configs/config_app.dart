enum Env { production, development }

class ConfigApp {
  Env env;
  String webUrl;
  String apiUrl;
  String locale;
  String lang;
  String placeAndroidAPIKey;
  String placeIosAPIKey;
  String oneSignalAPIKey;
  String sentryDsn;
  String clientApiKey;
  String clientApiId;
  String clientAppCode;

  ConfigApp({
    this.env = Env.development,
    this.webUrl = 'https://reseller.forisa.co.id',
    this.apiUrl = 'https://reseller.forisa.co.id/api',
    this.locale = 'id_ID',
    this.lang = 'ID',
    this.placeAndroidAPIKey = 'AIzaSyCXrwiLuQKip8x9DSqMFZt563tSXhBdGiY',
    this.placeIosAPIKey = 'AIzaSyCXrwiLuQKip8x9DSqMFZt563tSXhBdGiY',
    this.oneSignalAPIKey = '232ad261-d527-40f3-bede-a584408f1855',
    this.sentryDsn =
    'https://6b6e92e1d5d04390b851fcfb70204473@o516922.ingest.sentry.io/5805528',
    this.clientApiKey = 'ZZSAWdmJodSFzUMOf9I0tsC7gB6yeaDa7CoX5tB5',
    this.clientApiId = '5',
    this.clientAppCode = 'RMS',
  });

  // Method to update configuration dynamically
  void updateConfig({
    Env? env,
    String? webUrl,
    String? apiUrl,
    String? locale,
    String? lang,
    String? placeAndroidAPIKey,
    String? placeIosAPIKey,
    String? oneSignalAPIKey,
    String? sentryDsn,
    String? clientApiKey,
    String? clientApiId,
    String? clientAppCode,
  }) {
    this.env = env ?? this.env;
    this.webUrl = webUrl ?? this.webUrl;
    this.apiUrl = apiUrl ?? this.apiUrl;
    this.locale = locale ?? this.locale;
    this.lang = lang ?? this.lang;
    this.placeAndroidAPIKey = placeAndroidAPIKey ?? this.placeAndroidAPIKey;
    this.placeIosAPIKey = placeIosAPIKey ?? this.placeIosAPIKey;
    this.oneSignalAPIKey = oneSignalAPIKey ?? this.oneSignalAPIKey;
    this.sentryDsn = sentryDsn ?? this.sentryDsn;
    this.clientApiKey = clientApiKey ?? this.clientApiKey;
    this.clientApiId = clientApiId ?? this.clientApiId;
    this.clientAppCode = clientAppCode ?? this.clientAppCode;
  }
}