String formatDate(final DateTime dateTime) {
  final DateTime today = DateTime.now();
  final Duration difference = dateTime.difference(today);

  return switch (difference.abs()) {
    Duration(inSeconds: 0) => 'Added just now',
    Duration(inSeconds: final int seconds) when seconds < 60 =>
    'Added $seconds seconds ago',
    Duration(inMinutes: 1) => 'Added a minute ago',
    Duration(inMinutes: final int minutes) when minutes < 60 =>
    'Added $minutes minutes ago',
    Duration(inHours: final int hours) when hours < 24 =>
    'Added $hours hours ago',
    Duration(inDays: final int days) when days < 7 => 'Added $days days ago',
    Duration(inDays: final int days) when days > 7 =>
    'Added ${days.abs() ~/ 7} weeks ago',
    _ => 'Error while reading date'
  };
}
