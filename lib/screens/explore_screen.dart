import 'package:flutter/material.dart';

import '../components/components.dart';
import '../models/models.dart';
import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {
  // 1
  final mockService = MockFooderlichService();

  ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
      ),
      child: Column(
        children: [
          Text('Recipes of the Day 🍳',
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          FutureBuilder(
              future: mockService.getExploreData(),
              builder: (context, AsyncSnapshot<ExploreData> snapshot) {
                // TODO: Add Nested List Views
                if (snapshot.connectionState == ConnectionState.done) {
                  final recipes = snapshot.data?.todayRecipes ?? [];
                  return TodayRecipeListView(recipes: recipes);
                } else {
                  return Column(
                    children: [
                      const Text('Loading data...'),
                      const SizedBox(height: 10),
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
              }),
        ],
      ),
    );
  }
}
