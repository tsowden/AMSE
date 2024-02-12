// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/favorites.dart';
import 'package:testing_app/screens/home.dart';
import 'package:testing_app/screens/media.dart';

void main() {
  runApp(const TestingApp());
}

GoRouter router() {
  return GoRouter(
    routes: [
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: FavoritesPage.routeName,
            builder: (context, state) => const FavoritesPage(),
          ),
          GoRoute(
          path: MediaPage.routeName,
          builder: (BuildContext context, GoRouterState state) => MediaPage(),
        ),
        ],
      ),
    ],
  );
}

class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        title: 'Titres likés',
        theme: ThemeData(
          colorSchemeSeed: Color.fromARGB(255, 182, 215, 241),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
          scaffoldBackgroundColor: Color.fromARGB(255, 29, 29, 29),
        ),
        routerConfig: router(),
      ),
    );
  }
}
