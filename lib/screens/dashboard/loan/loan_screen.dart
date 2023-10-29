

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoanScreen extends StatefulHookConsumerWidget {
  const LoanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoanScreenState();
}
class _LoanScreenState extends ConsumerState<LoanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}