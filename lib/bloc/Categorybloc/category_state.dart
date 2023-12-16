
import 'package:chipapp/model/categorymodel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CategoryState extends Equatable {}

class CategoryInitialState extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryLoadedState extends CategoryState {
  final List<Datum> categoryModel;

  CategoryLoadedState(this.categoryModel);

  @override
  // TODO: implement props
  List<Object?> get props => [categoryModel];
}

class CategoryErrorState extends CategoryState {
  final String error;

  CategoryErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
