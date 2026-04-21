// HandleWhiteboard - Whiteboard Updates Handler
//
// Responsibilities:
// - Parse whiteboard updates (scene, pointer, page, file changes)
// - Handle drawing events
// - Handle whiteboard encryption (if E2EE enabled)
// - Update whiteboard provider
// - Handle office file presentations
// - Handle whiteboard reset

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:torii_app/features/meet/data/models/proto/wajlc_datamessage.pb.dart';
import 'package:torii_app/features/meet/providers/whiteboard_provider.dart';
import 'package:torii_app/features/meet/core/meet_handler_context.dart';

class HandleWhiteboard {
  final Ref? ref; // Riverpod ref for accessing providers (optional)
  final MeetHandlerContext? meetContext;

  HandleWhiteboard({this.ref, this.meetContext});
  
  /// Handle whiteboard message
  Future<void> handleWhiteboardMsg(DataChannelMessage payload) async {
    switch (payload.type) {
      case DataMsgBodyType.SCENE_UPDATE:
        // Excalidraw (web + mobile viewer): mảng phần tử JSON.
        _updateExcalidrawElements(payload.message);
        break;
        
      case DataMsgBodyType.POINTER_UPDATE:
        // Update mouse pointer location
        _updateMousePointerLocation(payload.message);
        break;
        
      case DataMsgBodyType.PAGE_CHANGE:
        // Change whiteboard page (only if not presenter)
        if (!_isCurrentUserPresenter()) {
          _setWhiteboardCurrentPage(int.tryParse(payload.message) ?? 0);
        }
        break;
        
      case DataMsgBodyType.FILE_CHANGE:
        // Change office file (only if not presenter)
        if (!_isCurrentUserPresenter()) {
          _updateCurrentWhiteboardOfficeFileId(payload.message);
        }
        break;
        
      case DataMsgBodyType.UPDATE_CURRENT_OFFICE_FILE_PAGES:
        // Update office file pages (only if not presenter)
        if (!_isCurrentUserPresenter()) {
          _updateCurrentOfficeFilePages(payload.message);
        }
        break;
        
      case DataMsgBodyType.WHITEBOARD_APP_STATE_CHANGE:
        // Mobile chỉ xem: luôn áp dụng viewport từ presenter web (không chặn theo isPresenter —
        // tránh thiếu zoom/scroll nếu metadata role lệch).
        ref?.read(whiteboardProvider.notifier).resetLocalPan();
        try {
          _updateMouseAppStateChanges(payload.message);
        } catch (e) {
          if (kDebugMode) {
            print('HandleWhiteboard: Failed to parse app state - $e');
          }
        }
        break;
        
      case DataMsgBodyType.WHITEBOARD_RESET:
        // Reset whiteboard (only if not presenter)
        if (!_isCurrentUserPresenter()) {
          _triggerWhiteboardReset();
        }
        break;
        
      default:
        if (kDebugMode) {
          print('HandleWhiteboard: Unknown message type ${payload.type}');
        }
    }
  }
  
  // Provider update methods (will be replaced with actual provider calls)
  
  void _updateExcalidrawElements(String elements) {
    // Dispatch to whiteboard provider
    ref?.read(whiteboardProvider.notifier).updateExcalidrawElements(elements);
    
    if (kDebugMode) {
      print('HandleWhiteboard: Updated Excalidraw elements');
    }
  }
  
  void _updateMousePointerLocation(String location) {
    // Dispatch to whiteboard provider
    ref?.read(whiteboardProvider.notifier).updateMousePointerLocation(location);
    
    if (kDebugMode) {
      print('HandleWhiteboard: Updated mouse pointer location');
    }
  }
  
  void _setWhiteboardCurrentPage(int page) {
    // Dispatch to whiteboard provider
    ref?.read(whiteboardProvider.notifier).setWhiteboardCurrentPage(page);
    
    if (kDebugMode) {
      print('HandleWhiteboard: Set current page to $page');
    }
  }
  
  void _updateCurrentWhiteboardOfficeFileId(String fileId) {
    // Dispatch to whiteboard provider
    ref?.read(whiteboardProvider.notifier).updateCurrentWhiteboardOfficeFileId(fileId);
    
    if (kDebugMode) {
      print('HandleWhiteboard: Updated office file ID to $fileId');
    }
  }
  
  void _updateCurrentOfficeFilePages(String pages) {
    // Dispatch to whiteboard provider
    ref?.read(whiteboardProvider.notifier).updateCurrentOfficeFilePages(pages);
    
    if (kDebugMode) {
      print('HandleWhiteboard: Updated office file pages');
    }
  }
  
  void _updateMouseAppStateChanges(String appState) {
    // Dispatch to whiteboard provider  
    try {
      final parsed = jsonDecode(appState);
      final appStateMap = parsed is Map<String, dynamic>
          ? parsed
          : <String, dynamic>{};
      ref?.read(whiteboardProvider.notifier).updateMouseAppStateChanges(appStateMap);
    } catch (e) {
      if (kDebugMode) {
        print('HandleWhiteboard: Failed to update app state - $e');
      }
    }
    
    if (kDebugMode) {
      print('HandleWhiteboard: Updated app state');
    }
  }
  
  void _triggerWhiteboardReset() {
    // Dispatch to whiteboard provider
    ref?.read(whiteboardProvider.notifier).triggerWhiteboardReset();
    
    if (kDebugMode) {
      print('HandleWhiteboard: Triggered whiteboard reset');
    }
  }
  
  bool _isCurrentUserPresenter() {
    return meetContext?.meetLocalIsPresenter ?? false;
  }
}
