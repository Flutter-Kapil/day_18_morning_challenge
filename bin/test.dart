import 'main.dart';
import 'package:test/test.dart';

void main() {
  test("test case 1", () {
    expect(
        noStrangers(
            "See Spot run. See Spot jump. Spot likes jumping. See Spot fly."),
        [
          ["spot", "see"],
          []
        ]);
  });
  test("test case 2", () {
    expect(doesRhyme("Sam I am!", "Green eggs and ham."), true);
  });

  test("test case 3", () {
    expect(
        canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]), true);
  });
}
