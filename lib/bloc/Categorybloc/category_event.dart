import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
@immutable
abstract class CategoryEvent extends Equatable {}

class FetchcategoryEvent extends CategoryEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
