import 'package:get/get.dart';
import 'package:task_manager/ui/controller/task_controller.dart';

class ControllerBinder extends Bindings{
    @override
    void dependencies() {
        Get.lazyPut(() => TaskController());

    }
}