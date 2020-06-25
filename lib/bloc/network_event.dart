part of 'network_bloc.dart';

abstract class NetworkEvent extends Equatable {
  const NetworkEvent();
}

class Connected extends NetworkEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
 class Disconnected extends NetworkEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];

 }