import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/custom_exception.dart';
import '../../core/resources/shared_app_strings.dart';
import '../../core/utils/core_utils.dart';
import '../states/data_state.dart';

class BaseCubit extends Cubit<DataState> {
  BaseCubit() : super(InitialState());

  void handleExceptions(final Object e) {
    final message = e is CustomException
        ? e
        : e is NoInternetException
            ? SharedAppStrings.noInternetString
            : SharedAppStrings.someErrorOccurredString;

    customPrint('ERROR: $message: $e');

    emit(ErrorState(message.toString()));
  }
}
