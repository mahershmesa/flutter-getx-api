import 'package:flutter/material.dart';
import 'package:flutter_getx_api/controllers/products_controller.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
final ProductController productController=Get.put(ProductController());

final List categores=[
    "Tshirt",
  "Pants",
  "Jeans",
  "Jackets",
  "Shirt",
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTop(),
          buildCategorisRow(categores: categores),
          Expanded(child: Obx((){ 
            if(productController.loading.value ){
              return const Center(child: CircularProgressIndicator());
            }
            if(productController.products.isEmpty){
              return const Center(child: Text('no products found'));
            }
          
            if(productController.showGrid.value)
            return GridView.builder(
              padding: const EdgeInsets.only(top: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7
              ),
              itemCount: productController.products.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
              elevation: 0.0,
              child: Container(
              height: 150,
              padding: const EdgeInsets.all(16),
              //width: 100,
              //color: Colors.red,
              margin: const EdgeInsets.only(bottom:8.0),
              child: Column(
                children: [
                  Container(width: 100,
                  height: 100,
                  //color: Colors.green,
                  decoration: BoxDecoration(
                    image:DecorationImage(
                      image: NetworkImage(productController.products[index]["image"]),
                      fit: BoxFit.fill,
                      ) ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                        Text(productController.products[index]["title"],style: const TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,overflow: TextOverflow.ellipsis,),
                        Expanded(child: Text(productController.products[index]["description"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        )),
                        Text('\$${productController.products[index]["price"]}',style: const TextStyle(fontWeight: FontWeight.bold),),
                      ],),
                    ),
                  )
                ],
              ),
                      ),
            );///////مكرر
              },
            );
            return _buildProductList();
          },
          ),
          ),
          ],
        ),
      ),
    );
  }

  ListView _buildProductList() {
    return ListView.builder(
            itemCount: productController.products.length,
          padding:const EdgeInsets.only(top: 16),
          itemBuilder: (context,index)=>Card(
            elevation: 0.0,
            child: Container(
            height: 120,
            padding: EdgeInsets.all(16),
            //width: 100,
            //color: Colors.red,
            margin: const EdgeInsets.only(bottom:8.0),
            child: Row(
              children: [
                Container(width: 100,
                //color: Colors.green,
                decoration: BoxDecoration(
                  image:DecorationImage(
                    image: NetworkImage(productController.products[index]["image"]),
                    fit: BoxFit.fill,
                    ) ),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                      Text(productController.products[index]["title"],style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,overflow: TextOverflow.ellipsis,),
                      Expanded(child: Text(productController.products[index]["description"],
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      ),
                      ),
                      Text('\$${productController.products[index]["price"]}',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],),
                  ),
                )
              ],
            ),
                    ),
          ),
        );
  }

  Row buildTop() {
    return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Cloths',style: TextStyle(fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                          
                          }, icon: const Icon(Icons.keyboard_arrow_down)
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){ productController.toggleGrid();}, icon: const Icon(Icons.filter_list)),
                ],
              );
  }

  AppBar buildAppBar() {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Mshop',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: const BackButton(),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_none_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      );
  }
}

class buildCategorisRow extends StatelessWidget {
  const buildCategorisRow({
    Key? key,
    required this.categores,
  }) : super(key: key);

  final List categores;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      margin: const EdgeInsets.only(top: 16.0),
      child: ListView.builder(
        itemCount: categores.length,/////من الكاتيغوريس
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index)=> Container(
          margin: EdgeInsets.only(right: 8),
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color:index==0? Colors.black:   Colors.transparent,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
        child:  Text(categores[index],style: TextStyle(color: index==0?  Colors.white: Colors.black),),
      ),),
    );
  }
}
