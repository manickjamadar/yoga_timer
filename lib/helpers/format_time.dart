String formatTimeInWords(Duration duration) {
  final formatter = DurationFormatter.format(duration);
  String format = "${formatter.seconds} Secs";
  if (duration.inMinutes > 0) {
    format = "${formatter.minutes} Mins " + format;
  }
  if (duration.inHours > 0) {
    format = "${formatter.hours} Hours " + format;
  }
  return format;
}

String formatTime(Duration duration) {
  final formatter = DurationFormatter.format(duration);
  String format = "${formatter.seconds}";
  if (duration.inMinutes > 0) {
    format = "${formatter.minutes}:" + format;
  }
  if (duration.inHours > 0) {
    format = "${formatter.hours}:" + format;
  }
  return format;
}

class DurationFormatter {
  final String hours;
  final String minutes;
  final String seconds;
  const DurationFormatter._(this.hours, this.minutes, this.seconds);
  factory DurationFormatter.format(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitHours = twoDigits(duration.inHours);
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return DurationFormatter._(twoDigitHours, twoDigitMinutes, twoDigitSeconds);
  }
}
