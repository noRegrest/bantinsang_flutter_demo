import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

// Create an instance of the LocalAuthentication class
final LocalAuthentication auth = LocalAuthentication();

// Define a function to authenticate the user
Future<bool> authenticateUser() async {
  // Check if biometric authentication is available on the device
  bool isAvailable = await auth.canCheckBiometrics;
  if (!isAvailable) {
    return false;
  }

  // Define the biometric authentication type(s) to use (e.g. fingerprint, face)
  List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

  // Authenticate the user with the chosen biometric type(s)
  bool authenticated = false;
  try {} on PlatformException catch (e) {
    print(e);
  }

  return authenticated;
}
