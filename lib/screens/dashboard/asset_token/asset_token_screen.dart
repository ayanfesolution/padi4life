import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AssetTokenScreen extends StatefulHookConsumerWidget {
  const AssetTokenScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AssetTokenScreenState();
}

class _AssetTokenScreenState extends ConsumerState<AssetTokenScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.brown,
    );
  }
}
