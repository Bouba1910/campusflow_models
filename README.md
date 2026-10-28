# CampusFlow – modèles Dart

Petit projet en Dart pur qui définit les modèles de CampusFlow (`Task`, `Course`, `User`), leur conversion JSON et un service qui simule le chargement asynchrone des données.

## Prérequis

- Dart SDK 3.5 ou plus récent

## Commandes

```bash
dart pub get              # installer les dépendances
dart run bin/main.dart    # lancer le programme
dart test                 # lancer les tests
```

## Structure

- `lib/models/` : les classes `Task`, `Course` et `User`
- `lib/services/` : `CampusFlowService`, qui renvoie les données fictives avec `Future.delayed`
- `bin/main.dart` : affiche les données chargées, un exemple d'encodage/décodage JSON et de `copyWith()`
- `test/` : tests de `copyWith`, `fromJson` et des données invalides
