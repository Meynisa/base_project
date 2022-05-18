import 'package:core/core.dart';

class TimeUtils {
  //TIME UTILS
  String timestampToDateString(DateFormat dateFormat, int timestamp) {
    return dateFormat
        .format(new DateTime.fromMillisecondsSinceEpoch(timestamp));
  }

//CONVERTER STRING TO DATE
  DateTime dateStringToDateTime(String dateString) {
    return DateTime.parse(dateString).toLocal();
  }

//DATE FORMATTER
  String dateFormat(DateTime date, {String dateFormat = "MMM dd, yyyy"}) {
    return DateFormat(dateFormat).format(date);
  }

//CALCULATE DIFFERENTIATE DAYS
  String calculateDiffInDays(DateTime dateTimeBefore, DateTime dateTimeAfter) {
    var diffInDays =
        dateTimeAfter.difference(dateTimeBefore).inDays; //differentiate by days
    return diffInDays.toString();
  }

  int calculateDiffInHours(DateTime dateTimeBefore, DateTime dateTimeAfter) {
    var diffInDays = FlavorConfig.instance!.flavor != Flavor.PRODUCTION
        ? dateTimeAfter.difference(dateTimeBefore).inMinutes
        : dateTimeAfter
            .difference(dateTimeBefore)
            .inHours; //differentiate by seconds
    return diffInDays;
  }

  int calculateDiffInMonth(DateTime dateTime) {
    var diffInDays = ((dateTime.difference(DateTime.now()).inDays.abs()) / 30)
        .floor(); //diffe
    return diffInDays;
  }
}
