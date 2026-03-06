class Person {
  String name;
  int age;

  Person(this.name, this.age);
}

void main() {
  List<Person> people = [
    Person("joy", 25),
    Person("talia", 30),
    Person("claude", 35),
    Person("Anna", 22),
    Person("bertrand", 28),
    Person("Daniel", 40),
    Person("cimerode", 19),
    Person("Eva-lyne", 33),
  ];

  List<Person> filtered = people
      .where((p) => p.name.startsWith('A') || p.name.startsWith('B'))
      .toList();

  double averageAge = filtered.map((p) => p.age).reduce((a, b) => a + b) / filtered.length;

  print("People starting with 'A' or 'B':");
  filtered.forEach((p) => print("  ${p.name}: ${p.age}"));
  print("\nAverage age: ${averageAge.toStringAsFixed(1)}");

}
