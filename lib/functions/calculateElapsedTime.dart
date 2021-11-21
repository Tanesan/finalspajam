String calculateElapsedTime(DateTime datetime) {
  Duration duration = DateTime.now().difference(datetime);
  return "${duration.inHours}h${duration.inMinutes - 60 * duration.inHours}m";
}