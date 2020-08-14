class Tranche {
  final int id, price;
  final String title, description, image;

  Tranche({this.id, this.price, this.title, this.description, this.image});
}

// list of products
// for our demo
List<Tranche> tranches = [
  Tranche(
    id: 1,
    price: 3500,
    title: "Trimestre 1",
    image: "assets/images/cheque.png",
    description: "Tranche payée ",
  ),
  Tranche(
    id: 4,
    price: 3000,
    title: "Trimestre 2",
    image: "assets/images/cheque.png",
    description: "Tranche non payée ",
  ),
  Tranche(
    id: 9,
    price: 2500,
    title: "Trimestre 3",
    image: "assets/images/cheque.png",
    description: "Tranche non payée",
  ),
];
