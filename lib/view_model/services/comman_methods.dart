
String getTimeFromFileName(String fileName) {
  // Remove file extension
  String fileNameWithoutExtension = fileName.split('.').first;

  // Extract the camera identifier and time substring
  List<String> parts = fileNameWithoutExtension.split('_');
  String cameraIdentifier = parts[1].substring(2);
  String timeSubstring = parts[2];

  // Get the hour, minute, and second substrings
  String hourSubstring = timeSubstring.substring(8, 10);
  String minuteSubstring = timeSubstring.substring(10, 12);
  String secondSubstring = timeSubstring.substring(12, 14);

  // Convert hour substring to an integer
  int hour = int.parse(hourSubstring);

  // Determine if it's AM or PM
  String period = (hour < 12) ? 'AM' : 'PM';

  // Format the hour based on 12-hour clock format
  if (hour > 12) {
    hour -= 12;
  } else if (hour == 0) {
    hour = 12;
  }

  // Format the time string
  String formattedTime = 'Cam:-$cameraIdentifier ($hour:$minuteSubstring:$secondSubstring $period)';

  return formattedTime;
}

String convertToTimeFormat(String inputString) {
  double input = double.tryParse(inputString) ?? 0.0;

  // Decimal part of the input
  int decimalPart = ((input - input.floor()) * 60).toInt();

  // Integer part of the input
  int integerPart = input.floor();

  // Create the time format string
  String timeFormat = '$integerPart:${decimalPart.toString().padLeft(2, '0')}';

  return timeFormat;
}