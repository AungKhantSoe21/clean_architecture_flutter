import 'dart:developer';

import '/core/constants/font_constants.dart';
import '/core/services/data_state.dart';
import '/features/countries/presentation/states/country_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountrySelection extends ConsumerWidget {
  const CountrySelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(countryDataState);
    return Scaffold(
      body: state.when(
        data: (d) {
          return d is DataSuccess 
          ? ListView.builder(
            itemCount: d.data!.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Image(width: 100, height: 100, image: NetworkImage(d.data![i].image!), fit: BoxFit.cover,),
                title: Text(d.data![i].country!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: FontConstants.m),),
                subtitle: Text(d.data![i].countryCode!, style: TextStyle(fontSize: FontConstants.s),),
              );
            }
          )
          : const Center(child: Text("DATA FETCHED FAILED"),);
        }, 
        error: (o, errTrace) {
          log(errTrace.toString());
          return const Center(child: Text("Error"));
        }, 
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.black,),)
      )
    );
  }
}