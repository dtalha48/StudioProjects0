void main(List<String> args) {
  var statesAndCapitals = {
    "California": "Sacramento",
    "Texas": "Austin",
    "Florida": "Tallahassee",
    "New York": "Albany",
    "Illinois": "Springfield"
  };


  print("For loop:");
  for (int i = 0; i < statesAndCapitals.keys.length; i++) {
    String state = statesAndCapitals.keys.elementAt(i);
    print("State: $state, Capital: ${statesAndCapitals[state]}");
  }


  print("\nForeach loop:");
  statesAndCapitals.forEach((state, capital) {
    print("State: $state, Capital: $capital");
  });
}
