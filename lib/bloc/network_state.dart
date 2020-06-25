part of 'network_bloc.dart';

abstract class NetworkState extends Equatable {
  const NetworkState();
}

class NetworkInitial extends NetworkState {
  @override
  List<Object> get props => [];
}
class NetworkConected extends NetworkState {
  @override
  List<Object> get props => [];
}