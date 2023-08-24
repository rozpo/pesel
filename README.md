# PESEL Library

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/rozpo/pesel/dart.yml)
![Codecov](https://img.shields.io/codecov/c/github/rozpo/pesel)
![GitHub release (with filter)](https://img.shields.io/github/v/release/rozpo/pesel)
![GitHub](https://img.shields.io/github/license/rozpo/pesel)

The PESEL library is a Dart package that provides functionality to work with PESEL (Personal Identification Number) in Poland. PESEL is used to identify individuals and contains information about birthdate and sex.

https://obywatel.gov.pl/pl/dokumenty-i-dane-osobowe/czym-jest-numer-pesel

## Installation

To use this library in your Dart project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  pesel: ^1.0.0
```

Then, run `dart pub get` to fetch the package.

## Usage

```dart
import 'package:pesel/pesel.dart';

void main() {
  // Create a Pesel instance
  final peselString = "22291028314";
  final pesel = Pesel(peselString);

  // Print the PESEL number
  print(pesel);

  // Check if the PESEL is valid
  if (pesel.isValid) {
    print("This PESEL is valid.");
  } else {
    print("This PESEL is not valid.");
  }

  // Check if the PESEL belongs to a male or female
  if (pesel.isMale) {
    print("This PESEL belongs to a male.");
  } else if (pesel.isFemale) {
    print("This PESEL belongs to a female.");
  }

  // Print the sex of the individual
  print("Sex: ${pesel.sex}");

  // Print the date of birth
  print("Date of Birth: ${pesel.dateOfBirth}");
}
```

## API Reference

### Class: Pesel

Represents a PESEL (Personal Identification Number) in Poland, used to identify individuals.

#### Constructors

- `Pesel(String pesel)`: Creates a Pesel instance from a valid PESEL string.

#### Properties

- `bool isMale`: Checks if the PESEL belongs to a male individual.
- `bool isFemale`: Checks if the PESEL belongs to a female individual.
- `bool isValid`: Checks if the PESEL is valid based on its checksum.
- `DateTime dateOfBirth`: Retrieves the date of birth associated with the PESEL.
- `Sex sex`: Determines the sex of the individual associated with the PESEL.

### Enum: Sex

Represents the biological sex of an individual.

- `male`: Represents the male sex.
- `female`: Represents the female sex.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
