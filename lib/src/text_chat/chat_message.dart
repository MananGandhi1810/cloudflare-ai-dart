enum Role {
  system,
  user,
  assistant;
}

class ChatMessage {
  late Role role;
  late String content;

  ChatMessage({
    required this.role,
    required this.content,
  });

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
    content = json['content'];
  }

  Map toJson() {
    Map res = {};
    res['role'] = role.name;
    res['content'] = content;
    return res;
  }
}
