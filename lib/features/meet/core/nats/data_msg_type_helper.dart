// Helper to parse DataMsgBodyType from string
DataMsgBodyType _parseDataMsgBodyType(String type) {
  switch (type) {
    case 'SCENE_UPDATE':
      return DataMsgBodyType.SCENE_UPDATE;
    case 'POINTER_UPDATE':
      return DataMsgBodyType.POINTER_UPDATE;
    case 'PAGE_CHANGE':
      return DataMsgBodyType.PAGE_CHANGE;
    case 'FILE_CHANGE':
      return DataMsgBodyType.FILE_CHANGE;
    case 'UPDATE_CURRENT_OFFICE_FILE_PAGES':
      return DataMsgBodyType.UPDATE_CURRENT_OFFICE_FILE_PAGES;
    case 'WHITEBOARD_APP_STATE_CHANGE':
      return DataMsgBodyType.WHITEBOARD_APP_STATE_CHANGE;
    case 'WHITEBOARD_RESET':
      return DataMsgBodyType.WHITEBOARD_RESET;
    case 'REQ_FULL_WHITEBOARD_DATA':
      return DataMsgBodyType.REQ_FULL_WHITEBOARD_DATA;
    default:
      return DataMsgBodyType.SCENE_UPDATE;
  }
}
