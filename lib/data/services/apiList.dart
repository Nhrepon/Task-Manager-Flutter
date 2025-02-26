class ApiList{
  static const String baseUrl = "https://task.teamrabbil.com/api/v1";

  static const String registration = '$baseUrl/registration';
  static const String login = '$baseUrl/login';
  static const String createTask = '$baseUrl/createTask';
  static const String taskStatusCount = '$baseUrl/taskStatusCount';

  static String taskListByStatus(String status) => '$baseUrl/listTaskByStatus/$status';

  static String profileUpdate = '$baseUrl/profileUpdate';

}