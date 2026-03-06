import 'dart:io';
import 'dart:convert';

void main() {
  processGrades('entree.csv', 'sortie.csv');
}

void processGrades(String inputPath, String outputPath) {
  // Lecture du fichier d'entrée
  final lines = File(inputPath).readAsLinesSync();

  // Traitement des lignes (en ignorant l'en-tête)
  final outputLines = lines.mapIndexed((index, line) {
    if (index == 0) return '$line,Grade'; // Ajout de l'en-tête

    final parts = line.split(',');
    if (parts.length < 2) return line; // ligne invalide, on la recopie telle quelle

    final name = parts[0];
    // Elvis : si la conversion échoue, on utilise 0.0
    final avg = double.tryParse(parts[1]) ?? 0.0;

    // Lambda pour déterminer le grade
    final grade = (double a) {
      if (a >= 90) return 'A';
      if (a >= 80) return 'B';
      if (a >= 70) return 'C';
      if (a >= 60) return 'D';
      return 'F';
    }(avg);

    return '$line,$grade';
  }).toList();

  // Écriture du fichier de sortie
  File(outputPath).writeAsStringSync(outputLines.join('\n'));
}

// Extension pour avoir map avec index (car Dart ne le fournit pas nativement)
extension MapIndexed<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T item) f) {
    var i = 0;
    return map((item) => f(i++, item));
  }
}
