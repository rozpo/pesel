import 'package:pesel/pesel.dart';
import 'package:test/test.dart';

void main() {
  group('Pesel()', () {
    group('throws assert when PESEL is', () {
      test('too short', () {
        expect(() => Pesel('1234567890'), throwsA(isA<AssertionError>()));
      });

      test('too long', () {
        expect(() => Pesel('123456789012'), throwsA(isA<AssertionError>()));
      });
    });
  });

  group('Pesel().isValid returns', () {
    test('true', () => expect(Pesel('22291028314').isValid, isTrue));
    test('false', () => expect(Pesel('12345678901').isValid, isFalse));
  });
}
