import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
@immutable
abstract class ProductEvent extends Equatable {}

class FetchProductEvent extends ProductEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


