import 'package:flutter/material.dart';

class ApplicationListScreen extends StatefulWidget {
  const ApplicationListScreen({super.key});

  @override
  State<ApplicationListScreen> createState() => _ApplicationListScreenState();
}

class _ApplicationListScreenState extends State<ApplicationListScreen> {
  // Mock data - in a real app, this would come from a database
  final List<JobApplication> _applications = [
    JobApplication(
      id: '1',
      companyName: 'Tech Corp',
      position: 'Software Engineer',
      applicantName: 'John Doe',
      email: 'john@example.com',
      phone: '+1234567890',
      applicationDate: DateTime.now().subtract(const Duration(days: 5)),
      uploadedDocuments: ['/path/to/resume.docx'],
      status: 'pending',
    ),
    JobApplication(
      id: '2',
      companyName: 'Design Studio',
      position: 'UI Designer',
      applicantName: 'Jane Smith',
      email: 'jane@example.com',
      phone: '+0987654321',
      applicationDate: DateTime.now().subtract(const Duration(days: 2)),
      uploadedDocuments: ['/path/to/portfolio.docx', '/path/to/resume.docx'],
      status: 'reviewed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Applications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/new_application');
            },
          ),
        ],
      ),
      body: _applications.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.work_off,
                  size: 80,
                  color: Colors.grey,
                ),
                const SizedBox(height: 16),
                const Text(
                  'No applications yet',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/new_application');
                  },
                  child: const Text('Create First Application'),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: _applications.length,
            itemBuilder: (context, index) {
              final application = _applications[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getStatusColor(application.status),
                    child: Icon(
                      _getStatusIcon(application.status),
                      color: Colors.white,
                    ),
                  ),
                  title: Text('${application.companyName} - ${application.position}'),
                  subtitle: Text(
                    'Applied: ${_formatDate(application.applicationDate)}\n'
                    'Documents: ${application.uploadedDocuments.length}',
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/application_detail',
                      arguments: application,
                    );
                  },
                ),
              );
            },
          ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'reviewed':
        return Colors.blue;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'pending':
        return Icons.schedule;
      case 'reviewed':
        return Icons.visibility;
      case 'accepted':
        return Icons.check_circle;
      case 'rejected':
        return Icons.cancel;
      default:
        return Icons.help;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}