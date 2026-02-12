// Whiteboard Provider - Riverpod State Management
// 1:1 clone of apps/meet/src/store/slices/whiteboard.ts

import 'package:flutter_riverpod/flutter_riverpod.dart';

class WhiteboardOfficeFile {
  final String fileId;
  final String fileName;
  final String filePath;
  final int totalPages;
  final int currentPage;
  final String pageFiles;
  
  const WhiteboardOfficeFile({
    required this.fileId,
    required this.fileName,
    required this.filePath,
    required this.totalPages,
    this.currentPage = 1,
    this.pageFiles = '',
  });
}

class WhiteboardState {
  final int totalPages;
  final int currentPage;
  final String excalidrawElements;
  final String mousePointerLocation;
  final Map<String, dynamic>? whiteboardAppState;
  final Map<String, dynamic> requestedWhiteboardData;
  final String currentWhiteboardOfficeFileId;
  final String currentOfficeFilePages;
  final List<WhiteboardOfficeFile> whiteboardUploadedOfficeFiles;
  final int refreshWhiteboardSignal;
  final int whiteboardResetSignal;
  final String allExcalidrawElements;
  
  const WhiteboardState({
    this.totalPages = 10,
    this.currentPage = 1,
    this.excalidrawElements = '',
    this.mousePointerLocation = '',
    this.whiteboardAppState,
    this.requestedWhiteboardData = const {'requested': false, 'sendTo': ''},
    this.currentWhiteboardOfficeFileId = 'default',
    this.currentOfficeFilePages = '',
    this.whiteboardUploadedOfficeFiles = const [],
    this.refreshWhiteboardSignal = 0,
    this.whiteboardResetSignal = 0,
    this.allExcalidrawElements = '',
  });
  
  WhiteboardState copyWith({
    int? totalPages,
    int? currentPage,
    String? excalidrawElements,
    String? mousePointerLocation,
    Map<String, dynamic>? whiteboardAppState,
    Map<String, dynamic>? requestedWhiteboardData,
    String? currentWhiteboardOfficeFileId,
    String? currentOfficeFilePages,
    List<WhiteboardOfficeFile>? whiteboardUploadedOfficeFiles,
    int? refreshWhiteboardSignal,
    int? whiteboardResetSignal,
    String? allExcalidrawElements,
  }) {
    return WhiteboardState(
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      excalidrawElements: excalidrawElements ?? this.excalidrawElements,
      mousePointerLocation: mousePointerLocation ?? this.mousePointerLocation,
      whiteboardAppState: whiteboardAppState ?? this.whiteboardAppState,
      requestedWhiteboardData: requestedWhiteboardData ?? this.requestedWhiteboardData,
      currentWhiteboardOfficeFileId: currentWhiteboardOfficeFileId ?? this.currentWhiteboardOfficeFileId,
      currentOfficeFilePages: currentOfficeFilePages ?? this.currentOfficeFilePages,
      whiteboardUploadedOfficeFiles: whiteboardUploadedOfficeFiles ?? this.whiteboardUploadedOfficeFiles,
      refreshWhiteboardSignal: refreshWhiteboardSignal ?? this.refreshWhiteboardSignal,
      whiteboardResetSignal: whiteboardResetSignal ?? this.whiteboardResetSignal,
      allExcalidrawElements: allExcalidrawElements ?? this.allExcalidrawElements,
    );
  }
}

class WhiteboardNotifier extends StateNotifier<WhiteboardState> {
  WhiteboardNotifier() : super(const WhiteboardState());
  
  void updateExcalidrawElements(String elements) {
    state = state.copyWith(excalidrawElements: elements);
  }
  
  void updateMousePointerLocation(String location) {
    state = state.copyWith(mousePointerLocation: location);
  }
  
  void updateMouseAppStateChanges(Map<String, dynamic> appState) {
    state = state.copyWith(whiteboardAppState: appState);
  }
  
  void addAllExcalidrawElements(String elements) {
    state = state.copyWith(allExcalidrawElements: elements);
  }
  
  void updateRequestedWhiteboardData(Map<String, dynamic> data) {
    state = state.copyWith(requestedWhiteboardData: data);
  }
  
  void setWhiteboardCurrentPage(int page) {
    state = state.copyWith(
      currentPage: page,
      excalidrawElements: '',
      allExcalidrawElements: '',
    );
  }
  
  void updateCurrentWhiteboardOfficeFileId(String fileId) {
    final file = state.whiteboardUploadedOfficeFiles.firstWhere(
      (f) => f.fileId == fileId,
      orElse: () => const WhiteboardOfficeFile(fileId: '', fileName: '', filePath: '', totalPages: 0),
    );
    
    state = state.copyWith(
      currentWhiteboardOfficeFileId: fileId,
      totalPages: file.fileId.isNotEmpty ? file.totalPages : state.totalPages,
      currentOfficeFilePages: file.fileId.isNotEmpty ? file.pageFiles : '',
      currentPage: 1,
      excalidrawElements: '',
      allExcalidrawElements: '',
    );
  }
  
  void updateCurrentOfficeFilePages(String pages) {
    state = state.copyWith(currentOfficeFilePages: pages);
  }
  
  void addWhiteboardUploadedOfficeFile(WhiteboardOfficeFile file) {
    final exists = state.whiteboardUploadedOfficeFiles.any((f) => f.fileId == file.fileId);
    if (!exists) {
      state = state.copyWith(
        whiteboardUploadedOfficeFiles: [...state.whiteboardUploadedOfficeFiles, file],
      );
    }
  }
  
  void triggerRefreshWhiteboard() {
    state = state.copyWith(refreshWhiteboardSignal: DateTime.now().millisecondsSinceEpoch);
  }
  
  void triggerWhiteboardReset() {
    state = state.copyWith(
      excalidrawElements: '',
      allExcalidrawElements: '',
      whiteboardResetSignal: DateTime.now().millisecondsSinceEpoch,
    );
  }
  
  void addWhiteboardDataSentFromDonor(Map<String, dynamic> data) {
    state = state.copyWith(
      currentWhiteboardOfficeFileId: data['currentWhiteboardOfficeFileId'] as String? ?? '',
      currentPage: data['currentPageNumber'] as int? ?? 1,
      currentOfficeFilePages: data['currentOfficeFilePages'] as String? ?? '',
      allExcalidrawElements: data['elements'] as String? ?? '',
    );
  }
}

final whiteboardProvider = StateNotifierProvider<WhiteboardNotifier, WhiteboardState>((ref) {
  return WhiteboardNotifier();
});
