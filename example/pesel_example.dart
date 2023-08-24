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
