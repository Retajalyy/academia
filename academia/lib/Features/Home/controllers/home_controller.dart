import 'package:academia/Features/Home/models/user_model.dart';
import 'package:get/get.dart';
import '../models/class_model.dart';
import '../models/assignment_model.dart';
import '../services/home_service.dart';


class HomeController extends GetxController {
  final HomeService service = HomeService();

  var isLoading = true.obs;

  var user = Rxn<UserModel>();
  var classes = <ClassModel>[].obs;
  var assignments = <AssignmentModel>[].obs;

  @override
  void onInit() {
    fetchHome();
    super.onInit();
  }

  Future<void> fetchHome() async {
    try {
      isLoading(true);

      final data = await service.fetchHomeData("USER_ID");

      user.value = UserModel.fromJson(data['user']);

      classes.value = (data['classes'] as List)
          .map((e) => ClassModel.fromJson(e))
          .toList();

      assignments.value = (data['assignments'] as List)
          .map((e) => AssignmentModel.fromJson(e))
          .toList();

    } finally {
      isLoading(false);
    }
  }
}