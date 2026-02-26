import '../models/notebook_model.dart';

class NotebookListState {
  final bool isLoading;
  final String? error;
  final List<Notebook> myNotebooks;
  final List<Notebook> publicNotebooks;

  const NotebookListState({
    this.isLoading = false,
    this.error,
    this.myNotebooks = const [],
    this.publicNotebooks = const [],
  });

  NotebookListState copyWith({
    bool? isLoading,
    String? error,
    List<Notebook>? myNotebooks,
    List<Notebook>? publicNotebooks,
  }) {
    return NotebookListState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      myNotebooks: myNotebooks ?? this.myNotebooks,
      publicNotebooks: publicNotebooks ?? this.publicNotebooks,
    );
  }
}
