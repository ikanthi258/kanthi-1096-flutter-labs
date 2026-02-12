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
