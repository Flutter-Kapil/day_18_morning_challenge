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
List<List> noStrangers(String line) {
  //remove all .
  line = line.replaceAll('.', '');
  //split the string into list of words
  List listFromLine = line.split(" ");
  List<List> finalList = [[], []];
  //count how many times each word occur in a list and add them to finalList
  for (int i = 0; i < listFromLine.length; i++) {
    if (splitNCount(listFromLine, i) >= 5) {
      finalList[1].add(listFromLine[i]);
    } else if (splitNCount(listFromLine, i) >= 3) {
      finalList[0].add(listFromLine[i]);
    }
  }
  //make sure both the lists in finalList contains unique items only
  finalList[0] = finalList[0].toSet().toList();
  finalList[1] = finalList[1].toSet().toList();
  return finalList;
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
  List splitXString = x.split(' ');
  List splitYString = y.split(' ');
  List xVowels = IndexOfVowels(splitXString.last);
  List yVowels = IndexOfVowels(splitYString.last);
  if (AreListEqual(xVowels, yVowels)) {
    return true;
  } else {
    return false;
  }
}

String CleanString(String x) {
  return x.split('.').toString().split('!').toString().split(',').toString();
}

List IndexOfVowels(String x) {
  List indexList = [];
  for (int i = 0; i < x.length; i++) {
    if (x[i] == 'a' ||
        x[i] == 'e' ||
        x[i] == 'i' ||
        x[i] == 'o' ||
        x[i] == 'u') {
      indexList.add(i);
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
