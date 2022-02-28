import 'package:flutter_getx_api/controllers/products_repository.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  
ProductsRepository productsRepository= ProductsRepository();
RxBool loading=false.obs;
  List products=[].obs;
  var showGrid=false.obs;

ProductController(){
loadproductsFromRepo();
} 

  loadproductsFromRepo()async{
loading(true);
products= await productsRepository.loadproductsFromApi();
loading(false);//هون كان عنا برينت ليطبع بلكونسول
  }

  toggleGrid(){
    showGrid(!showGrid.value);
  }
}