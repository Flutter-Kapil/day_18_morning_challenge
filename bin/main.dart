// Challenge 1
// Write test cases for next 3 challenges. Also include tests for boundary conditions
// For this challenge, the input will be a (long) string.

// Challenge 2
// A word encountered for the first time is a stranger.
// A word encountered thrice becomes an acquaintance.
// A word encountered 5 times becomes a friend.

// Create a function that takes the string and returns a list of two lists.
// The first is a list of acquaintances in the order they became an acquaintance (see example).
// The second is a list of friends in the order they became a friend.
// Words in the friend list should no longer be in the acquaintance list.

// Example
// noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly.")
// ➞ [["spot", "see"], []]
/// "see" was encountered first but "spot" became an acquaintance earlier.
List<List<String>> noStrangers(String line) {
  String toCheck = CleanString(line);
  List wordsList = toCheck.split(' ');
  List<String> acqList = [];
  List<String> friendsList = [];
  Map<String, int> wordCount = {};
  wordsList.forEach((wordX) {
    wordCount[wordX] = wordCount.containsKey(wordX) ? wordCount[wordX] + 1 : 1;
  });
  print(wordCount);
  wordCount.forEach((key, val) {
    if (wordCount[key] >= 5) {
      friendsList.add(key);
    } else if (wordCount[key] >= 3) {
      acqList.add(key);
    }
  });
//  print([acqList.toSet().toList(), friendsList.toSet().toList()]);
  return [acqList.toSet().toList(), friendsList.toSet().toList()];
}

int splitNCount(List listFromLine, int n) {
//  line = line.replaceAll('.', '');
//  List listFromLine = line.split(" ");
  int count = 0;
  for (int i = 0; i < listFromLine.length; i++) {
    if (listFromLine[n] == listFromLine[i]) {
      count++;
    }
  }
  return count;
}

// Challenge 3
// Rhyme Time
// Create a function that returns true if two lines rhyme and false otherwise.
// For the purposes of this exercise, two lines rhyme if the last
// word from each sentence contains the same vowels.
// Example:
// doesRhyme("Sam I am!", "Green eggs and ham.") ➞ true
bool doesRhyme(String x, String y) {
  x = CleanString(x);
  y = CleanString(y);
  print(x);
  print(y);
  List splitXString = x.split(' ');
  List splitYString = y.split(' ');
  List xVowels = IndexOfVowels(splitXString.last);
//  print(xVowels);
  List yVowels = IndexOfVowels(splitYString.last);
//  print(yVowels);
  if (AreListEqual(xVowels, yVowels)) {
    return true;
  } else {
    return false;
  }
}

String CleanString(String x) {
  return x.replaceAll('.', '').replaceAll('!', '').replaceAll(',', '');
}

List IndexOfVowels(String x) {
  List indexList = [];
  for (int i = 0; i < x.length; i++) {
    if (x[i] == 'a' ||
        x[i] == 'e' ||
        x[i] == 'i' ||
        x[i] == 'o' ||
        x[i] == 'u') {
      indexList.add(x[i]);
    }
  }
  return indexList;
}

bool AreListEqual(List x, List y) {
  if (x.length != y.length) {
    return false;
  }
  for (int i = 0; i < x.length; i++) {
    if (x[i] != y[i]) {
      return false;
    }
  }
  return true;
}

// Challenge 4
// Do All Bigrams (2 character words) Exist?
// You are given an input list of bigrams, and a list of words.
//
// Write a function that returns true if you can find every single bigram from
// this list can be found at least once in an list of words.
//
// Examples
// canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]) ➞ true
bool canFind(List list1, List list2) {
  bool result = true;
  for (int i = 0; i < list2.length; i++) {
    if (!CanFindInWord(list1, list2[i])) {
//      print("fount ${list1[i]} in ${list2[i]}");
      result = false;
    }
  }
  return result;
}

bool CanFindInWord(List x, String y) {
  for (int i = 0; i < x.length; i++) {
    if (y.contains(x[i])) {
//      print('found ${x[i]} in $y');
      return true;
    }
  }
  return false;
}

main() {
  print(noStrangers(
      "See Spot run. See Spot jump. Spot likes jumping. See Spot fly."));
  print(doesRhyme("Sam I am!", "Green eggs and ham."));
  print(canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat", 'xyz']));
}
