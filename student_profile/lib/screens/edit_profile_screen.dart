import 'package:flutter/material.dart';
import '../models/student.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.student});
  final Student student;
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController name;
  late final TextEditingController id;
  late final TextEditingController department;
  late final TextEditingController email;
  late final TextEditingController phone;
  late int semester;
  @override
  void initState() {
    super.initState();
    final s = widget.student;
    name = TextEditingController(text: s.name);
    id = TextEditingController(text: s.id);
    department = TextEditingController(text: s.department);
    email = TextEditingController(text: s.email);
    phone = TextEditingController(text: s.phone);
    semester = s.semester;
  }

  @override
  void dispose() {
    for (final controller in [name, id, department, email, phone]) {
      controller.dispose();
    }
    super.dispose();
  }

  void save() {
    if (!formKey.currentState!.validate()) return;
    Navigator.pop(
      context,
      Student(
        name: name.text.trim(),
        id: id.text.trim(),
        department: department.text.trim(),
        semester: semester,
        email: email.text.trim(),
        phone: phone.text.trim(),
      ),
    );
  }

  Widget field(
    String label,
    TextEditingController controller,
    IconData icon, {
    TextInputType? keyboard,
    String? Function(String?)? validator,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboard,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
      validator:
          validator ??
          (value) =>
              value == null || value.trim().isEmpty ? 'Enter $label' : null,
    ),
  );
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Edit Profile')),
    body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    field('Name', name, Icons.person_outline),
                    field('Student ID', id, Icons.badge_outlined),
                    field('Department', department, Icons.school_outlined),
                    DropdownButtonFormField<int>(
                      initialValue: semester,
                      decoration: const InputDecoration(
                        labelText: 'Semester',
                        prefixIcon: Icon(Icons.calendar_month_outlined),
                      ),
                      items: [
                        for (var i = 1; i <= 8; i++)
                          DropdownMenuItem(
                            value: i,
                            child: Text('Semester $i'),
                          ),
                      ],
                      onChanged: (value) {
                        if (value != null) semester = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    field(
                      'Email',
                      email,
                      Icons.email_outlined,
                      keyboard: TextInputType.emailAddress,
                      validator: (value) =>
                          RegExp(
                            r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                          ).hasMatch(value?.trim() ?? '')
                          ? null
                          : 'Enter a valid email',
                    ),
                    field(
                      'Phone',
                      phone,
                      Icons.phone_outlined,
                      keyboard: TextInputType.phone,
                      validator: (value) =>
                          (value ?? '').replaceAll(RegExp(r'\D'), '').length >=
                              7
                          ? null
                          : 'Enter a valid phone number',
                    ),
                    FilledButton.icon(
                      onPressed: save,
                      icon: const Icon(Icons.save_outlined),
                      label: const Text('Save changes'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
