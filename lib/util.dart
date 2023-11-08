// ignore_for_file: non_constant_identifier_names

List<Map> FoodList = [
  {
    "cat_name": "Pizza",
    "cat_image":
        "https://media.istockphoto.com/id/1192094401/photo/delicious-vegetarian-pizza-on-white.jpg?s=2048x2048&w=is&k=20&c=0PxtzaX36DekaPwrG3B86MLGKp4UqMYqX3cj4vRR-1w=",
    "product_list": [
      {
        "name": "Italian",
        "price": 11,
        "rating": 4.5,
        "image":
            "https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Pizza-3007395.jpg/330px-Pizza-3007395.jpg",
      },
      {
        "name": "Mexican",
        "price": 12,
        "rating": 4.3,
        "image":
            "https://img.freepik.com/premium-photo/isolated-mexican-pizza-with-minced-meat-olives_219193-6047.jpg?w=740",
      },
      {
        "name": "American",
        "price": 10,
        "rating": 4.2,
        "image":
            "https://media-cdn.tripadvisor.com/media/photo-s/10/67/33/0e/photo1jpg.jpg",
      }
    ]
  },
  {
    "cat_name": "Salad",
    "cat_image":
        "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA0L3BmLXM5OS1tbi1xdWlub2EtYm93bC02LWpvYjczM18xLmpwZw.jpg?s=_-nb9tqkMEm--gL1pJiq-1pzciP7DPgy5v4U7eiU1Ng",
    "product_list": [
      {
        "name": "Fried Rice",
        "price": 7,
        "rating": 4.4,
        "image":
            "https://www.pavaniskitchen.com/wp-content/uploads/2022/05/fried-rice.jpg",
      },
      {
        "name": "Savannah Salad",
        "price": 3,
        "rating": 4.2,
        "image":
            "https://media.istockphoto.com/id/528360281/photo/garden-salad-overhead-view.jpg?s=612x612&w=0&k=20&c=QcCXQyxzG27ttYrgcblJvwOUkmWfsvV2Q54TEFikOuM=",
      },
      {
        "name": "Turkey Salad",
        "price": 8,
        "rating": 4.0,
        "image":
            "https://media.istockphoto.com/id/1056419208/photo/grilled-chicken-breast-and-vegetables.jpg?s=612x612&w=0&k=20&c=_seZ-9HcA9Pty-OGkNsUh9dFiGhIPhCXBTKTkmFIFi8=",
      },
    ]
  },
  {
    "cat_name": "Pasta",
    "cat_image":
        "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGFzdGF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
    "product_list": [
      {
        "name": "Red sauce",
        "price": 11,
        "rating": 4.5,
        "image":
            "https://www.sharmispassions.com/wp-content/uploads/2022/11/RedSaucePasta5.jpg",
      },
      {
        "name": "White sauce",
        "price": 8,
        "rating": 4.2,
        "image":
            "https://img.freepik.com/premium-photo/penne-pasta-cream-cheese-wooden-background_967074-177.jpg?size=626&ext=jpg",
      },
      {
        "name": "Mix sauce",
        "price": 13,
        "rating": 4.6,
        "image":
            "https://www.kimscravings.com/wp-content/uploads/2021/01/creamy-pasta-sauce-7-768x1152.jpg",
      }
    ]
  },
];

List<Map> cartList = [];

String formatNumber(int number) {
  return number < 10 ? '0$number' : number.toString();
}
