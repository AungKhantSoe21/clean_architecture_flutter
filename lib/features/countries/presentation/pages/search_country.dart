import 'package:clean_architecture_flutter/features/countries/presentation/states/country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/constants/font_constants.dart';

class SearchCountry extends ConsumerWidget {
  const SearchCountry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(CountryState.searchState);
    final searchedData = ref.watch(CountryState.searchData);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Country"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 45,
            child: TextField(
              onChanged: (v) {
                ref.read(CountryState.searchData.notifier).search(key: v);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xfff1f1f1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search for Items",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: searchState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : searchedData.isEmpty
                    ? const Center(
                        child: Text("No search result!!"),
                      )
                    : ListView.builder(
                        itemCount: searchedData.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            leading: Image(
                              width: 100,
                              height: 100,
                              image: NetworkImage(searchedData[i].image!),
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              searchedData[i].country!,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontConstants.m),
                            ),
                            subtitle: Text(
                              searchedData[i].countryCode!,
                              style: TextStyle(fontSize: FontConstants.s),
                            ),
                          );
                        },
                      ),
          )
        ],
      ),
    );
  }
}
