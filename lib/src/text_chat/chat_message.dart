enum Role {
  /// system message
  system,

  /// user message
  user,

  /// assistant message
  assistant;
}

/// Chat message model
class ChatMessage {
  /// Role of the message
  late Role role;

  /// Content of the message
  late String content;

  /// Constructor
  ChatMessage({
    required this.role,
    required this.content,
  });

  /// Function to create a chat message object from JSON data
  ChatMessage.fromJson(json) {
    switch (json['role']) {
      case 'system':
        role = Role.assistant;
        break;
      case 'user':
        role = Role.user;
        break;
      case 'assistant':
        role = Role.assistant;
        break;
      default:
        throw Exception("Invalid role");
    }

    /// Set the content of the message
    content = json['content'];
  }

  /// Function to convert the chat message object to JSON data
  Map toJson() {
    /// Create a map to store the data
    Map res = {};

    /// Add the role to the map
    res['role'] = role.name;

    /// Add the content to the map
    res['content'] = content;

    /// Return the map
    return res;
  }
}
