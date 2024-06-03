import 'dart:developer';

import 'package:go_router/go_router.dart';

import '../../../../core/utils/constants/font_constants.dart';
import '../../../../core/utils/data_state/data_state.dart';
import '../../domain/entities/country_entity.dart';
import '/features/countries/presentation/states/country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<DataState<List<CountryEntity>>> state = ref.watch(CountryState.countryData);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/searchCountry");
        },
        child: const Icon(Icons.search),
      ),
      body: state.when(
        data: (d) {
          return d is DataSuccess
              ? ListView.builder(
                  itemCount: d.data!.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      leading: Image(
                        width: 100,
                        height: 100,
                        image: NetworkImage(d.data![i].image!),
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        d.data![i].country!,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontConstants.m),
                      ),
                      subtitle: Text(
                        d.data![i].countryCode!,
                        style: TextStyle(fontSize: FontConstants.s),
                      ),
                    );
                  })
              : const Center(
                  child: Text("DATA FETCHED FAILED"),
                );
        },
        error: (o, errTrace) {
          log(errTrace.toString());
          return const Center(child: Text("Error"));
        },
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
