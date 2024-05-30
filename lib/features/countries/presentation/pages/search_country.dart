import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchCountry extends ConsumerWidget {
  const SearchCountry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const TextField(),
              IconButton(
                onPressed: () {
                  
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          Expanded(
            child: ListView(),
          )
        ],
      ),
    );
  }
}
