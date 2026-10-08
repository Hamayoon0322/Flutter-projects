class Student {
  const Student({
    required this.name,
    required this.id,
    required this.department,
    required this.semester,
    required this.email,
    required this.phone,
  });
  final String name;
  final String id;
  final String department;
  final int semester;
  final String email;
  final String phone;

  static const sample = Student(
    name: 'Ahmad Mohammad',
    id: 'CS-2026-104',
    department: 'Computer Science',
    semester: 3,
    email: 'ahmad@example.com',
    phone: '+93 700 123 456',
  );
}
