
class Constants{
static List <String> questions = [
  "What language is used to build Flutter apps?",
  "Who developed Flutter?",
  "Which widget type never changes its state after being built?",
  "What is the main function in every Flutter app?",
];

static Map <String, Map <String, bool>> answers = {
  questions[0]: {
    "Java": false,
    "Kotlin": false,
    "Dart": true,
    "Swift": false,
  },
  questions[1]: {
    "Apple": false,
    "Google": true,
    "Microsoft": false,
    "Facebook": false,
  },
  questions[2]: {
    "StatefulWidget": false,
    "StatelessWidget": true,
    "DynamicWidget": false,
    "ContainerWidget": false,
  },
  questions[3]: {
    "startApp()": false,
    "main()": true,
    "runApp()": false,
    "initApp()": false,
  },
};
}