import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? dioException;

  const DataState ({this.data, this.dioException});
}


class DataSuccess<T> extends DataState<T>{
  const DataSuccess({super.data});
}

class DataFailed<T> extends DataState<T>{
  const DataFailed({super.dioException});
}