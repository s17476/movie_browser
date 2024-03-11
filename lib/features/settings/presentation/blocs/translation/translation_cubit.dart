import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_state.dart';
part 'translation_cubit.g.dart';
part 'translation_cubit.freezed.dart';

class TranslationCubit extends Cubit<TranslationState> {
  TranslationCubit() : super(TranslationState.initial());

  // void translate(){
  //   state.
  // }
}
