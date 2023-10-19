import 'package:flutter/material.dart';
import 'package:flutter_dev_technical_exam_3_data_manipulation/model/Product.dart';
import '../controller/ProductController.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dev Technical Exam 3: Data Manipulation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Data Manipulation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> listProduct =[];
  TextEditingController priceStart = TextEditingController();
  TextEditingController priceEnd = TextEditingController();
  TextEditingController discount = TextEditingController();
  ProductController productController = ProductController();


   _getProductList() async {
    var list = await productController.getAllProduct();
    setState(() {
      listProduct = list;
    });
  }

  @override
  initState()  {
    _getProductList();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: listProduct.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name: ${ listProduct[index].name.toString()}"),
                      Text("Price: ${ listProduct[index].price.toString()}"),
                    ],
                  ),
                );
              },
            ),
            Padding(padding: const EdgeInsets.fromLTRB(5, 50, 5, 5),
                child:  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          const Text("Price Range"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width *0.45,
                                child: TextField(
                                  controller: priceStart,
                                  keyboardType:  TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter Starting Price',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width *0.45,
                                child:  TextField(
                                  controller: priceEnd,
                                  keyboardType:  TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter Ending Price',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(onPressed: () async {
                            int start = int.parse(priceStart.text);
                            int end = int.parse(priceEnd.text);
                            //get list from future controller
                            var list = await productController.getProductPriceRange(start, end);
                            //then update the listProduct
                            setState(() {
                              listProduct = list;
                            });
                          }, child: const Text('Search'),)
                        ],
                      ),)
                )),
            Padding(padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 5),
                child:  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                        child:   Column(
                          children: [
                            const Text("Discount Prices"),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *0.4,
                              child: TextField(
                                controller: discount,
                                keyboardType:  TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter % Discount',
                                ),
                              ),
                            ),
                            ElevatedButton(onPressed: () async {
                              int discounted = int.parse(discount.text.toString());
                              //get list from future controller
                              var list = await productController.getProductDiscountedPrice(discounted);
                              //then update the listProduct
                              setState(() {
                                listProduct = list;
                              });
                            }, child: const Text('Enter'),)
                          ],
                        ))
                )),


          ],
        ),
      )

    );
  }
}
