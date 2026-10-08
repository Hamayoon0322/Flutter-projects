import 'package:flutter/material.dart';
import 'lab_output.dart';

mixin Logger {
  final List<String> logs = [];
  void log(String message) {
    logs.add(message);
    debugPrint(message);
  }
}

class BankAccount with Logger {
  double _balance = 0;
  double get balance => _balance;
  bool deposit(double amount) {
    if (!amount.isFinite || amount <= 0) {
      log('Rejected deposit: amount must be positive and finite.');
      return false;
    }
    if (!(_balance + amount).isFinite) {
      log('Rejected deposit: balance would overflow.');
      return false;
    }
    _balance += amount;
    log(
      'Deposited \$${amount.toStringAsFixed(2)}. Balance: \$${balance.toStringAsFixed(2)}',
    );
    return true;
  }
}

class Lab5Page extends StatefulWidget {
  const Lab5Page({super.key});
  @override
  State<Lab5Page> createState() => _Lab5PageState();
}

class _Lab5PageState extends State<Lab5Page> {
  final account = BankAccount();
  @override
  void initState() {
    super.initState();
    account.deposit(100);
    account.deposit(-20);
  }

  @override
  Widget build(BuildContext context) => LabOutput(
    title: 'Lab 5 - Private Members & Mixins',
    lines: [
      'Balance through getter: \$${account.balance.toStringAsFixed(2)}',
      ...account.logs,
      'Dart privacy is library-level: _balance is accessible within this library, but not from another imported library. The getter exposes read-only access. Files joined with part share a library.',
    ],
    actions: [
      ElevatedButton.icon(
        onPressed: () => setState(() {
          account.deposit(25);
        }),
        icon: const Icon(Icons.add),
        label: const Text('Deposit \$25'),
      ),
      OutlinedButton(
        onPressed: () => setState(() {
          account.deposit(0);
        }),
        child: const Text('Try invalid deposit'),
      ),
    ],
  );
}
