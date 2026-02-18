// ============================================
// Async API Program : Fetch Public IP
//
// AI DOCUMENTATION
// use AI for only learning and sample concept explanation.
// All code implementation, structure, and debugging were completed independently.
//
// This program calling API by fetches the user's public IP address
// using jsonDecode for parses a JSON response.
// The result is displayed in the console output.
//
// @author Kanthi Phrakhienthong
// @date 2026-02-18
// ============================================

import 'dart:convert';
import 'package:http/http.dart' as http;

// Fetches the public IP from API and displays it //
Future<void> fetchIPAddress() async {
  try {
    final response = await http.get(
      Uri.parse('https://api.ipify.org?format=json'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body); // Parse JSON response
      final ipAddress = data['ip']; // Extract IP address from the parsed data

      print('Your public IP address is: $ipAddress');
    } else {
      print('Failed to fetch IP address. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

void main() async {
  await fetchIPAddress();
}
