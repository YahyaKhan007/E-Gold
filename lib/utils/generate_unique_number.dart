import 'dart:math';

String generateUniqueRandomNumber(Random random) {
  // Use DateTime.now() to ensure uniqueness
  int timestamp = DateTime.now().millisecondsSinceEpoch;

  // Generate a random number with a few digits
  int randomPart =
      random.nextInt(900000) + 100000; // Generates a 6-digit random number

  // Combine timestamp and random part to ensure uniqueness
  String uniqueNumber = '$timestamp$randomPart';

  // Limit to 16 digits if needed
  return uniqueNumber.substring(0, 16);
}
