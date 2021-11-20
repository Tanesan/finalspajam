bool isAnalysisFinished(String id, String message) {
  print(id);
  print(message.substring(7));
  return id == message.substring(7);
}