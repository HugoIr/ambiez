enum Flavor {
  local,
  testing,
  staging,
  production,
}

const local = 'local';
const testing = 'testing';
const staging = 'staging';
const production = 'production';

Flavor getFlavor(String strFlavor) {
  switch (strFlavor) {
    case local:
      return Flavor.local;
    case testing:
      return Flavor.testing;
    case staging:
      return Flavor.staging;
    case production:
      return Flavor.production;
  }
  throw Exception('Invalid App Flavor');
}
