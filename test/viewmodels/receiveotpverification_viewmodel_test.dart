import 'package:flutter_test/flutter_test.dart';
import 'package:e_gold/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ReceiveotpverificationViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
