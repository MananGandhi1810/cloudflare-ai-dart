import 'chat_message.dart';
import 'models.dart';
import 'response.dart';
import '../services/network_service.dart';
export 'models.dart';
export 'response.dart';
export 'chat_message.dart';

/// Text chat model class
class TextChatModel {
  /// Account ID
  late String accountId;

  /// API Key
  late String apiKey;

  /// Model to use
  late TextChatModels model;

  /// Raw status
  late bool raw;

  /// List of chat messages
  List<ChatMessage> _messages = [];

  /// Network service object
  NetworkService networkService = NetworkService();

  /// Base URL
  late String baseUrl;

  /// Constructor
  TextChatModel({
    required this.accountId,
    required this.apiKey,
    required this.model,
    this.raw = true,
  }) {
    baseUrl = "https://api.cloudflare.com/client/v4/accounts/$accountId/ai/run";

    /// Set the base URL
    if (accountId.trim() == "") {
      /// Throw an exception if account ID is empty
      throw Exception("Account ID cannot be empty");
    }
    if (apiKey.trim() == "") {
      /// Throw an exception if API key is empty
      throw Exception("API Key cannot be empty");
    }
  }

  /// Get all chat messages
  List<ChatMessage> get allMessages => _messages;

  /// Load a previous chat
  void loadMessages(List<Map<String, dynamic>> messages) {
    /// Load messages
    _messages =
        messages.map((message) => ChatMessage.fromJson(message)).toList();
  }

  /// Asynchronous function which returns the classification labels with their confidence of the text
  Future<ChatMessage> chat(String message) async {
    _messages.add(
      ChatMessage(
        /// Set role to user
        role: Role.user,

        /// Set content to message
        content: message,
      ),
    );

    /// Post request to the API
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "messages": _messages,
    });

    /// Create a response object from the JSON data
    TextChatResponse response = TextChatResponse.fromJson(res['data']);

    if (!response.success || response.result == null) {
      /// Throw an exception if the response is not successful
      throw Exception(response.errors);
    }
    _messages.add(
      ChatMessage(
        /// Set role to assistant
        role: Role.assistant,

        /// Set content to response
        content: response.result?.response ?? "",
      ),
    );

    /// Return the last message
    return _messages.last;
  }
}
