
import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'BaseRepository.dart';

class BaseBloc {
  BehaviorSubject<bool> loading = BehaviorSubject<bool>();
  BehaviorSubject<Response> create = BehaviorSubject<Response>();
  BehaviorSubject<Response> get = BehaviorSubject<Response>();
  BehaviorSubject<Response> response = BehaviorSubject<Response>();
  BaseRepository repository = BaseRepository();

  dispose() {
    loading.close();
    create.close();
    get.close();
  }

  clear() {
    loading = BehaviorSubject<bool>();
    create = BehaviorSubject<Response>();
    get = BehaviorSubject<Response>();
  }
}
