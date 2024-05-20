import 'chat_message.dart';
import 'models.dart';
import 'response.dart';
import '../services/network_service.dart';
export 'models.dart';
export 'response.dart';
export 'chat_message.dart';

class TextChatModel {
  late String accountId;
  late String apiKey;
  late TextChatModels model;
  late bool raw;
  List<ChatMessage> _messages = [];
  NetworkService networkService = NetworkService();
  late String baseUrl;

  TextChatModel({
    required this.accountId,
    required this.apiKey,
    required this.model,
    this.raw = true,
  }) {
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";
    if (accountId.trim() == "") {
      throw Exception("Account ID cannot be empty");
    }
    if (apiKey.trim() == "") {
      throw Exception("API Key cannot be empty");
    }
  }

  // Get all chat messages
  List<ChatMessage> get allMessages => _messages;

  // Load a previous chat
  void loadMessages(List<Map<String, dynamic>> messages) {
    _messages =
        messages.map((message) => ChatMessage.fromJson(message)).toList();
  }

  // Asynchronous function which returns the classification labels with their confidence of the text
  Future<ChatMessage> chat(String message) async {
    _messages.add(
      ChatMessage(
        role: Role.user,
        content: message,
      ),
    );
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "messages": _messages,
    });
    TextChatResponse response = TextChatResponse.fromJson(res['data']);
    if (!response.success || response.result == null) {
      throw Exception(response.errors);
    }
    _messages.add(
      ChatMessage(
        role: Role.assistant,
        content: response.result?.response ?? "",
      ),
    );
    return _messages.last;
  }
}
