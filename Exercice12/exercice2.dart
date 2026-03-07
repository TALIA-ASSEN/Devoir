void main() {
  List<String> words = ["lion", "chien", "serpent", "oiseau", "tigre", "ours"];

  Map<String, int> wordLengths = {
    for (String word in words) word: word.length
  };

  wordLengths.entries
      .where((entry) => entry.value > 4)
      .forEach((entry) => print("${entry.key}: ${entry.value}"));
}