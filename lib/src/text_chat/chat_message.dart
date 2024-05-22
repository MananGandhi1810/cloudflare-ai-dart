enum Role {
  system, // system message
  user, // user message
  assistant; // assistant message
}
// Chat message model
class ChatMessage {
  late Role role; // Role of the message
  late String content; // Content of the message
// Constructor
  ChatMessage({
    required this.role,
    required this.content,
  });
// Function to create a chat message object from JSON data
  ChatMessage.fromJson(json) {
    switch (json['role']) {
      case 'system':// If role is system
        role = Role.assistant; // Set role to assistant
        break;
      case 'user': // If role is user
        role = Role.user; // Set role to user
        break;
      case 'assistant': // If role is assistant
        role = Role.assistant; // Set role to assistant
        break;
      default: // If role is invalid
        throw Exception("Invalid role"); // Throw an exception
    }
    content = json['content']; // Set the content of the message
  }
// Function to convert the chat message object to JSON data
  Map toJson() {
    Map res = {}; // Create a map to store the data
    res['role'] = role.name;  // Add the role to the map
    res['content'] = content; // Add the content to the map
    return res; // Return the map
  }
}
