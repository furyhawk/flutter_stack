// A simple test to check if the service is reachable
import 'dart:io';

void main() async {
  print('🔍 Testing network connection to service.furyhawk.lol...');
  
  try {
    // Test basic connectivity with a socket
    print('Testing socket connection on port 443...');
    final socket = await Socket.connect('service.furyhawk.lol', 443, timeout: Duration(seconds: 5));
    print('✅ Socket connection successful');
    await socket.close();
    
    // Test HTTPS connection with HttpClient
    print('Testing HTTPS connection...');
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse('https://service.furyhawk.lol'));
    final response = await request.close();
    print('✅ HTTPS connection successful, status code: ${response.statusCode}');
    await response.drain();
    client.close();
    
    print('All tests passed! The service appears to be reachable.');
  } catch (e) {
    print('❌ Connection test failed: $e');
    print('\nPossible solutions:');
    print('1. Check if your firewall allows outgoing connections to service.furyhawk.lol:443');
    print('2. Check your network connection');
    print('3. Verify that the service is actually running and accessible');
    print('4. Check if a corporate proxy or VPN is blocking the connection');
    print('5. On macOS, check Application Firewall settings in System Preferences > Security & Privacy');
  }
}
