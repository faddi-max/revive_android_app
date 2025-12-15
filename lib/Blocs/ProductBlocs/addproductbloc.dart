import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive_app/Events/ProductEvents/addproductevent.dart';
import 'package:revive_app/Repositries/ProductRepos/addproductrepo.dart';
import 'package:revive_app/State/Revivestate.dart';

class AddProductBloc extends Bloc<ProductEvents, Revivestate> {
  final AddProductRepo _addproductrepo = AddProductRepo();

  AddProductBloc() : super(ReviveInitial()) {
    on<AddProductRequested>(addproductevent);
  }

  Future<void> addproductevent(
    AddProductRequested event,
    Emitter<Revivestate> emit,
  ) async {
    emit(ReviveLoading());
    try {
      final productdata = _addproductrepo.Addproduct(event.product);
      emit(ReviveLoaded({"product": productdata}));
    } catch (e) {
      print(e);
      emit(ReviveError(e.toString()));
    }
  }
}
