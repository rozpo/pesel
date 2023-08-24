import 'package:pesel/pesel.dart';
import 'package:test/test.dart';

void main() {
  group('Pesel() throws assert when PESEL is', () {
    test('too short', () {
      expect(() => Pesel('1234567890'), throwsA(isA<AssertionError>()));
    });

    test('too long', () {
      expect(() => Pesel('123456789012'), throwsA(isA<AssertionError>()));
    });
  });

  group('Pesel().isValid returns', () {
    test('true', () => expect(Pesel('22291028314').isValid, isTrue));
    test('false', () => expect(Pesel('12345678901').isValid, isFalse));
  });

  group('Pesel().isMale', () {
    group('returns true when', () {
      test('digit is 1', () => expect(Pesel('00000000010').isMale, isTrue));
      test('digit is 3', () => expect(Pesel('00000000030').isMale, isTrue));
      test('digit is 5', () => expect(Pesel('00000000050').isMale, isTrue));
      test('digit is 7', () => expect(Pesel('00000000070').isMale, isTrue));
      test('digit is 9', () => expect(Pesel('00000000090').isMale, isTrue));
    });

    group('returns false when', () {
      test('digit is 0', () => expect(Pesel('00000000000').isMale, isFalse));
      test('digit is 2', () => expect(Pesel('00000000020').isMale, isFalse));
      test('digit is 4', () => expect(Pesel('00000000040').isMale, isFalse));
      test('digit is 6', () => expect(Pesel('00000000060').isMale, isFalse));
      test('digit is 8', () => expect(Pesel('00000000080').isMale, isFalse));
    });
  });

  group('Pesel().isFemale', () {
    group('returns true when', () {
      test('digit is 0', () => expect(Pesel('00000000000').isFemale, isTrue));
      test('digit is 2', () => expect(Pesel('00000000020').isFemale, isTrue));
      test('digit is 4', () => expect(Pesel('00000000040').isFemale, isTrue));
      test('digit is 6', () => expect(Pesel('00000000060').isFemale, isTrue));
      test('digit is 8', () => expect(Pesel('00000000080').isFemale, isTrue));
    });

    group('returns false when', () {
      test('digit is 1', () => expect(Pesel('00000000010').isFemale, isFalse));
      test('digit is 3', () => expect(Pesel('00000000030').isFemale, isFalse));
      test('digit is 5', () => expect(Pesel('00000000050').isFemale, isFalse));
      test('digit is 7', () => expect(Pesel('00000000070').isFemale, isFalse));
      test('digit is 9', () => expect(Pesel('00000000090').isFemale, isFalse));
    });
  });

  group('Pesel().sex', () {
    group('returns Sex.male when', () {
      test('digit is 1',
          () => expect(Pesel('00000000010').sex, equals(Sex.male)));
      test('digit is 3',
          () => expect(Pesel('00000000030').sex, equals(Sex.male)));
      test('digit is 5',
          () => expect(Pesel('00000000050').sex, equals(Sex.male)));
      test('digit is 7',
          () => expect(Pesel('00000000070').sex, equals(Sex.male)));
      test('digit is 9',
          () => expect(Pesel('00000000090').sex, equals(Sex.male)));
    });

    group('returns Sex.female when', () {
      test('digit is 0',
          () => expect(Pesel('00000000000').sex, equals(Sex.female)));
      test('digit is 2',
          () => expect(Pesel('00000000020').sex, equals(Sex.female)));
      test('digit is 4',
          () => expect(Pesel('00000000040').sex, equals(Sex.female)));
      test('digit is 6',
          () => expect(Pesel('00000000060').sex, equals(Sex.female)));
      test('digit is 8',
          () => expect(Pesel('00000000080').sex, equals(Sex.female)));
    });
  });

  group('Pesel().dateOfBirth is', () {
    test('1800-10-01',
        () => expect(Pesel('00810100000').dateOfBirth, DateTime(1800, 1, 1)));
    test('1900-10-01',
        () => expect(Pesel('00100100000').dateOfBirth, DateTime(1900, 10, 1)));
    test('2011-11-11',
        () => expect(Pesel('11311100000').dateOfBirth, DateTime(2011, 11, 11)));
    test('2148-02-12',
        () => expect(Pesel('48421200000').dateOfBirth, DateTime(2148, 2, 12)));
    test('2266-12-08',
        () => expect(Pesel('66720800000').dateOfBirth, DateTime(2266, 12, 8)));
  });
}
