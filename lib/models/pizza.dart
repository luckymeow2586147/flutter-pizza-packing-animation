class Pizza {
  final String image;
  final String title;
  final int price;
  final double rating;
  final String desc;
  final bool isVeg;
  final List<Map<String, String>> ingredients;

  Pizza({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.desc,
    required this.isVeg,
    required this.ingredients,
  });
}

final List<Pizza> pizzas = [
  Pizza(
    image: "assets/images/dynamite_philly_cheese_steak_pizza.png",
    title: "Dynamite Philly Cheese Steak Pizza",
    price: 19,
    rating: 4.0,
    desc:
        "Combination of mozzarella, Feta cheese, American cheese & rich creamy cheese.",
    isVeg: true,
    ingredients: [
      {"name": "Grilled Chicken", "quantity": "100g"},
      {"name": "Onions", "quantity": "50g"},
      {"name": "Mozzarella", "quantity": "100g"},
      {"name": "American Cheese", "quantity": "50g"},
      {"name": "Jalapenos", "quantity": "20g"},
      {"name": "Oregano", "quantity": "5g"},
      {"name": "Ranch Sauce", "quantity": "20ml"},
    ],
  ),

  Pizza(
    image: "assets/images/chicken_legend_ranch_jalapeno_pizza.png",
    title: "Chicken Legend Ranch & Jalapeno Pizza",
    price: 15,
    rating: 4.5,
    desc:
        "Grilled Chicken, Onions, Mozzarella, American Cheese, Jalapenos, Oregano, Ranch Sauce.",
    isVeg: false,
    ingredients: [
      {"name": "Grilled Chicken", "quantity": "100g"},
      {"name": "Onions", "quantity": "50g"},
      {"name": "Mozzarella", "quantity": "100g"},
      {"name": "American Cheese", "quantity": "50g"},
      {"name": "Jalapenos", "quantity": "20g"},
      {"name": "Oregano", "quantity": "5g"},
      {"name": "Ranch Sauce", "quantity": "20ml"},
    ],
  ),
  Pizza(
    image: "assets/images/rustic_spicy_italian_herb_pizza.png",
    title: "Rustic Spicy Italian Herb Pizza",
    price: 12,
    rating: 3.8,
    desc:
        "Combination of mozzarella, Feta cheese, American cheese & rich creamy cheese.",
    isVeg: true,
    ingredients: [
      {"name": "Grilled Chicken", "quantity": "100g"},
      {"name": "Onions", "quantity": "50g"},
      {"name": "Mozzarella", "quantity": "100g"},
      {"name": "American Cheese", "quantity": "50g"},
      {"name": "Jalapenos", "quantity": "20g"},
      {"name": "Oregano", "quantity": "5g"},
      {"name": "Ranch Sauce", "quantity": "20ml"},
    ],
  ),
  Pizza(
    image: "assets/images/classic_ultimate_pepperoni_feast_pizza.png",
    title: "Classic Ultimate Pepperoni Feast Pizza",
    price: 22,
    rating: 4.8,
    desc:
        "Combination of mozzarella, Feta cheese, American cheese & rich creamy cheese.",
    isVeg: false,
    ingredients: [
      {"name": "Grilled Chicken", "quantity": "100g"},
      {"name": "Onions", "quantity": "50g"},
      {"name": "Mozzarella", "quantity": "100g"},
      {"name": "American Cheese", "quantity": "50g"},
      {"name": "Jalapenos", "quantity": "20g"},
      {"name": "Oregano", "quantity": "5g"},
      {"name": "Ranch Sauce", "quantity": "20ml"},
    ],
  ),
];
