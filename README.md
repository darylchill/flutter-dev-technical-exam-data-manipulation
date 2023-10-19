# flutter_dev_technical_exam_3_data_manipulation

## Getting Started

This project is a starting point for a Flutter application.

Given the data below, create the following functions:

- Price range filter – a function that accepts two integers as price range and returns a list of specific products that matches the price range criteria.
- Apply discounted price – a function that accepts integer as percentage discount and returns a list of all products with their respective new discounted price based on the inputed percentage discount.

Data:

class Product {
  final String name;
  final double price;
  Product(this.name, this.price);
}

List<Product> productList = [
    Product('Smartphone', 12000),
    Product('Laptop', 60000),
    Product('Headphones', 3000),
    Product('Tablet', 7000),
    Product('Smartwatch', 1500),
  ];
#   f l u t t e r - d e v - t e c h n i c a l - e x a m - d a t a - m a n i p u l a t i o n  
 