import 'package:intl/intl.dart';

class TimeUtils {
  static String convertUtcToLocal(String utcTime) {
    final utcDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(utcTime, true);
    final localDate = utcDate.toLocal();
    return DateFormat("yyyy-MM-dd HH:mm:ss").format(localDate);
  }
}
