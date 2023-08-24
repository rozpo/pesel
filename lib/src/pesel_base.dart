/// Enum representing the biological sex of an individual.
enum Sex {
  /// Represents the male sex.
  male,

  /// Represents the female sex.
  female,
}

/// Represents a PESEL (Personal Identification Number) in Poland, used to identify individuals.
class Pesel {
  /// Representation of the PESEL number.
  final List<int> number;

  /// Constructs a Pesel instance from a valid PESEL string.
  ///
  /// The provided [pesel] must be exactly 11 characters long.
  factory Pesel(String pesel) {
    assert(pesel.length == 11);

    List<int> value = [];
    for (var number in pesel.split('')) {
      value.add(int.parse(number));
    }

    return Pesel._internal(value);
  }

  Pesel._internal(this.number);

  /// Checks if the PESEL belongs to a male individual.
  bool get isMale => _isMale();

  /// Checks if the PESEL belongs to a female individual.
  bool get isFemale => _isFemale();

  /// Checks if the PESEL is valid based on its checksum.
  bool get isValid => _isValid();

  /// Retrieves the date of birth associated with the PESEL.
  DateTime get dateOfBirth => _dateOfBirth();

  /// Determines the sex of the individual associated with the PESEL.
  Sex get sex => _sex();

  /// Determines whether the individual associated with the PESEL is male.
  bool _isMale() => number[9].isOdd;

  /// Determines whether the individual associated with the PESEL is female.
  bool _isFemale() => number[9].isEven;

  /// Determines the sex of the individual based on the PESEL.
  Sex _sex() => number[9].isOdd ? Sex.male : Sex.female;

  /// Validates the PESEL using its checksum.
  bool _isValid() {
    List<int> weights = [1, 3, 7, 9, 1, 3, 7, 9, 1, 3];
    int checksum = 0;

    for (int i = 0; i < weights.length; i++) {
      checksum += (number[i] * weights[i]) % 10;
    }

    return (10 - checksum % 10) == number.last;
  }

  /// Calculates and returns the date of birth associated with the PESEL.
  DateTime _dateOfBirth() {
    final int century;

    if (number[2] case 0 || 1) {
      century = 1900;
    } else if (number[2] case 2 || 3) {
      century = 2000;
    } else if (number[2] case 4 || 5) {
      century = 2100;
    } else if (number[2] case 6 || 7) {
      century = 2200;
    } else {
      century = 1800;
    }

    final year = century + number[0] * 10 + number[1];
    final month = (number[2].isEven ? 0 : 1) * 10 + number[3];
    final day = number[4] * 10 + number[5];

    return DateTime(year, month, day);
  }

  /// Returns a string representation of the [number].
  @override
  String toString() {
    return number.map((digit) => digit.toString()).join();
  }
}
