class ApiHost {
  static String get versionPath => '3';
  static String get baseURL => 'https://api.themoviedb.org/$versionPath';
  static String get baseImageURL => 'https://image.tmdb.org/t/p/w780';
  static Map<String, String> get defaultQueryParams => {
        'api_key': 'eb359aa2223d196a22977688a9cf0003',
        'language': 'pt-BR',
      };
}
