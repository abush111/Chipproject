import 'package:chipapp/api_reposirty/product_repository.dart';
import 'package:chipapp/bloc/productbloc/productevent.dart';
import 'package:chipapp/bloc/productbloc/productstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final Productrepo productService;
   

  ProductBloc(this.productService,) : super(ProductInitialState()) {
    on<FetchProductEvent>((event, emit) async {
      print("PRODUCT DATA BLOC CALLED!!");
      emit(ProductInitialState());
      try {
        final productData = await productService.fetchProducts();
        print("PRODUCT DATA FROM NETWORK $productData");
        emit(ProductLoadedState(productData));
       
      } catch (e) {
        print("${e.toString()}");
        emit(ProductErrorState(e.toString()));
      }
    });
  }
}
