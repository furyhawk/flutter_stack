import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stack/core/utils/service_locator.dart';
import 'package:flutter_stack/features/auth/domain/auth_provider.dart';
import 'package:flutter_stack/features/auth/presentation/login_screen.dart';
import 'package:flutter_stack/features/profile/data/profile_repository.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileRepository _profileRepository = ServiceLocator.profileRepository;
  
  bool _isLoading = false;
  String? _errorMessage;
  UserPublic? _user;
  
  @override
  void initState() {
    super.initState();
    _loadProfile();
  }
  
  Future<void> _loadProfile() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      final user = await _profileRepository.getCurrentUser();
      
      setState(() {
        _user = user;
      });
      
      // Update the user in the provider
      context.read<AuthProvider>().setCurrentUser(user);
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  
  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              
              await context.read<AuthProvider>().logout();
              
              if (mounted) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              }
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $_errorMessage',
                        style: TextStyle(color: Theme.of(context).colorScheme.error),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadProfile,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _user == null
                  ? const Center(child: Text('No profile data available'))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Column(
                              children: [
                                const CircleAvatar(
                                  radius: 50,
                                  child: Icon(Icons.person, size: 50),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  _user!.fullName ?? 'No Name',
                                  style: Theme.of(context).textTheme.headlineMedium,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  _user!.email ?? 'No Email',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          const Divider(),
                          const SizedBox(height: 16),
                          _buildProfileSection(
                            title: 'Personal Information',
                            child: Column(
                              children: [
                                _buildInfoRow(
                                  icon: Icons.email, 
                                  title: 'Email',
                                  subtitle: _user!.email ?? 'Not provided',
                                ),
                                const SizedBox(height: 8),
                                _buildInfoRow(
                                  icon: Icons.person_outline, 
                                  title: 'Full Name',
                                  subtitle: _user!.fullName ?? 'Not provided',
                                ),
                                const SizedBox(height: 8),
                                _buildInfoRow(
                                  icon: Icons.verified_user, 
                                  title: 'User ID',
                                  subtitle: _user!.id ?? 'Unknown',
                                ),
                                const SizedBox(height: 8),
                                _buildInfoRow(
                                  icon: Icons.admin_panel_settings, 
                                  title: 'Role',
                                  subtitle: _user!.isAdmin == true ? 'Admin' : 'User',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: _showEditProfileDialog,
                              icon: const Icon(Icons.edit),
                              label: const Text('Edit Profile'),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: _showChangePasswordDialog,
                              icon: const Icon(Icons.lock_outline),
                              label: const Text('Change Password'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.secondary,
                                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
    );
  }
  
  Widget _buildProfileSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          ),
        ),
      ],
    );
  }
  
  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  void _showEditProfileDialog() {
    final fullNameController = TextEditingController(text: _user!.fullName);
    final emailController = TextEditingController(text: _user!.email);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: fullNameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
              enabled: false, // Email can't be changed in this example
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (fullNameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Full name cannot be empty')),
                );
                return;
              }
              
              Navigator.of(context).pop();
              
              try {
                setState(() {
                  _isLoading = true;
                });
                
                await _profileRepository.updateProfile(
                  fullName: fullNameController.text,
                );
                
                await _loadProfile();
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile updated successfully')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')),
                  );
                  setState(() {
                    _isLoading = false;
                  });
                }
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
  
  void _showChangePasswordDialog() {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: currentPasswordController,
              decoration: const InputDecoration(
                labelText: 'Current Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: newPasswordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm New Password',
              ),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (currentPasswordController.text.isEmpty ||
                  newPasswordController.text.isEmpty ||
                  confirmPasswordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All fields are required')),
                );
                return;
              }
              
              if (newPasswordController.text != confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('New passwords do not match')),
                );
                return;
              }
              
              Navigator.of(context).pop();
              
              try {
                setState(() {
                  _isLoading = true;
                });
                
                await _profileRepository.updatePassword(
                  currentPassword: currentPasswordController.text,
                  newPassword: newPasswordController.text,
                );
                
                setState(() {
                  _isLoading = false;
                });
                
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password updated successfully')),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error: ${e.toString()}')),
                  );
                  setState(() {
                    _isLoading = false;
                  });
                }
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
}
