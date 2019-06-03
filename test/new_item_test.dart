import 'package:causedupeuple/utils/new_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check NewItem summary', () {
    final item = NewItem(
        title: '',
        content:
            "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nMorbi nec velit pulvinar, maximus nulla in, rhoncus nunc massa nunc.</p>",
        url: '',
        img: '',
        categories: [],
        date: DateTime.now());

    expect(item.getSummary(),
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Morbi nec velit pulvinar, maximus nulla in, rhoncus nunc massa n...");
  });
}
