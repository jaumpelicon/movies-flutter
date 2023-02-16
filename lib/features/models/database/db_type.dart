import 'enum_to_string.dart';

enum DBType with EnumToString {
  text('TEXT'),
  integer('INTEGER'),
  real('REAL');

  @override
  final String value;

  const DBType(this.value);
}
