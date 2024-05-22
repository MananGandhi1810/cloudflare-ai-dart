import 'chat_message.dart';
import 'models.dart';
import 'response.dart';
import '../services/network_service.dart';
export 'models.dart';
export 'response.dart';
export 'chat_message.dart';

/// Text chat model class
class TextChatModel {
  late String accountId;

  /// Account ID
  late String apiKey;

  /// API Key
  late TextChatModels model;

  /// Model to use
  late bool raw;

  /// Raw status
  List<ChatMessage> _messages = [];

  /// List of chat messages
  NetworkService networkService = NetworkService();

  /// Network service object
  late String baseUrl;

  /// Base URL
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
      throw Exception("Account ID cannot be empty");

      /// Throw an exception if account ID is empty
    }
    if (apiKey.trim() == "") {
      throw Exception("API Key cannot be empty");

      /// Throw an exception if API key is empty
    }
  }

  /// Get all chat messages
  List<ChatMessage> get allMessages => _messages;

  /// Return all messages

  /// Load a previous chat
  void loadMessages(List<Map<String, dynamic>> messages) {
    _messages =
        messages.map((message) => ChatMessage.fromJson(message)).toList();

    /// Load messages
  }

  /// Asynchronous function which returns the classification labels with their confidence of the text
  Future<ChatMessage> chat(String message) async {
    _messages.add(
      ChatMessage(
        role: Role.user,

        /// Set role to user
        content: message,

        /// Set content to message
      ),
    );
    Map<String, dynamic> res =
        await networkService.post("$baseUrl/${model.value}", apiKey, {
      "messages": _messages,
    });

    /// Post request to the API
    TextChatResponse response = TextChatResponse.fromJson(res['data']);

    /// Create a response object from the JSON data
    if (!response.success || response.result == null) {
      throw Exception(response.errors);

      /// Throw an exception if the response is not successful
    }
    _messages.add(
      ChatMessage(
        role: Role.assistant,

        /// Set role to assistant
        content: response.result?.response ?? "",

        /// Set content to response
      ),
    );
    return _messages.last;

    /// Return the last message
  }
}
