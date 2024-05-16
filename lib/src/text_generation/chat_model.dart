enum Role { system, user, assistant }

class ChatModel {
  late Role role;
  late String message;

  ChatModel({
    required Role role,
    required String messsage,
  });

  ChatModel.fromJson(data) {
    role = data['role'];
    message = data['message'];
  }

  Map toJson() {
    return {
      "role": role.name,
      "message": message,
    };
  }
}
