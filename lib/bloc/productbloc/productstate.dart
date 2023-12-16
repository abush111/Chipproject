import 'package:chipapp/model/productmodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProductState extends Equatable {}

class ProductInitialState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProductLoadedState extends ProductState {
  final List<Datum> productModel;

  ProductLoadedState(this.productModel);

  @override
  // TODO: implement props
  List<Object?> get props => [productModel];
}

class ProductErrorState extends ProductState {
  final String error;

  ProductErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
