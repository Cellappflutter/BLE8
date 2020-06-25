import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  @override
  NetworkState get initialState => NetworkInitial();

  @override
  Stream<NetworkState> mapEventToState(
    NetworkEvent event,
  ) async* {
    if (event is Disconnected ){
      yield NetworkInitial();
    }
    else if( event is Connected){
      yield NetworkConected();
    }
  }
}
