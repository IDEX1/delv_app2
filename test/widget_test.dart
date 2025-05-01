import 'package:delv_app/home_page.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Favourites page smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const HomePage());

    // Verify that the AppBar title "Favourites" is present.
    expect(find.text('Favourites'), findsOneWidget);

    // Verify that the category "Salade" exists in the horizontal list.
    expect(find.text('Salade'), findsOneWidget);

    
  });
}
