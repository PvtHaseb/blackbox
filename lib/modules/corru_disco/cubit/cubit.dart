import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:black_box/modules/corru_disco/cubit/states.dart';

class CorruptionDiscoveryCubit extends Cubit<CorruptionDiscoveryStates> {
  CorruptionDiscoveryCubit() : super(InitialCorruptionDiscoveryState());

}