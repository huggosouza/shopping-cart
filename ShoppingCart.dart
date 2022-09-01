import 'dart:io';

class ShoppingCart {
  void clearTerm() {
    print("\x1B[2J\x1B[0;0H");
  }

  var condition = true;
  List<String> products = [];
  void menu() {
    while (condition == true) {
      print("============ MENU ============");
      print("Options: add\nremove\nshow\nexit\n");
      var choice = stdin.readLineSync();
      if (choice == "add") {
        print("Type the product name: ");
        String? prodName = stdin.readLineSync();
        if (products.length < 1) {
          products.add(prodName!);
          print("Product sucessfully added to the list.");
          menu();
        } else {
          products.forEach((element) {
            if (prodName == element) {
              print("Product already exists on Shopping Cart.");
              menu();
            } else {
              products.add(prodName!);
              clearTerm();
              print("Product sucessfully added to the list.");
              menu();
            }
          });
        }
      } else if (choice == "remove") {
        print("Type product name to be removed: ");
        var prodTBR = stdin.readLineSync();
        products.remove(prodTBR);
        clearTerm();
        print("Product sucessfully removed.");
        menu();
      } else if (choice == "show") {
        clearTerm();
        print("Showing all products: ");
        print(products);
        menu();
      } else if (choice == "exit") {
        exit(0);
      } else {
        print("Invalid option!!");
        menu();
      }
    }
  }
}

void main() {
  ShoppingCart().menu();
}
