module ChatApp {
    struct ChatMessage {
        long id;
        string sender;
        string text;
        string timestamp;
    };

    sequence<ChatMessage> MessageSeq;
    sequence<string> UserSeq;

    exception ChatException {
        string reason;
    };

    interface ChatRoom {
        void login(string nickname) throws ChatException;
        void postMessage(string nickname, string message) throws ChatException;
        idempotent MessageSeq getPendingMessages(string nickname, long lastMessageId);
        idempotent UserSeq getOnlineUsers();
        void logout(string nickname);
    };
};