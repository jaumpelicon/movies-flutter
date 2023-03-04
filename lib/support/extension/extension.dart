import 'package:intl/intl.dart';

extension NullSafeBlock<T> on T? {
  void let(Function(T it) runnable) {
    final instance = this;
    if (instance != null) {
      runnable(instance);
    }
  }
}

extension StringParse on String {
  String toFormatDate() {
    if (isNotEmpty) {
      final date = DateFormat('yyyy-MM-dd').parse(this);
      return DateFormat('dd MMM yyyy').format(date);
    } else {
      return '01 Jan 1970';
    }
  }
}
