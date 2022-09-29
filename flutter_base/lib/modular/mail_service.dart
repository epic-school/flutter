abstract class AbstractMailService {
  void sendMail(String title, String body);
}

abstract class AbstractMailSendMethod {
  void handleMailSend(String title, String body);
}

class FirstMailHandler implements AbstractMailSendMethod {
  @override
  void handleMailSend(String title, String body) {
    print("#1 Mail was sent from first mail handler: $title, $body");
  }
}

class SecondMailHandler implements AbstractMailSendMethod {
  @override
  void handleMailSend(String title, String body) {
    print("#2 Mail was sent from second mail handler: $title, $body");
  }
}


class MailService implements AbstractMailService {
  final AbstractMailSendMethod mailHandler;

  MailService(this.mailHandler);

  void sendMail(String title, String body) {
    mailHandler.handleMailSend(title, body);
  }
}
