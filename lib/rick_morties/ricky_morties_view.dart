import 'package:flutter/material.dart';

import 'rick_morties_view_model.dart';

class RickyMortiesView extends RickyMortiesViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchAllData,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: models.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(models[index].image ??
                'https://rickandmortyapi.com/api/character/avatar/1.jpeg'),
          ),
          title: Text(models[index].name ?? ''),
        ),
      ),
    );
  }
}
