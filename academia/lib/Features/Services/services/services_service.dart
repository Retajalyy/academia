import 'package:academia/Core/utilities/colors.dart';
import '../models/service_item_model.dart';

class ServicesService {
  Future<List<ServiceSectionModel>> fetchSections() async {
    await Future.delayed(const Duration(milliseconds: 300));

    return [
      ServiceSectionModel(
        title: 'ACADEMIC',
        items: [
          const ServiceItemModel(
            id: 'courses',
            title: 'Courses',
            subtitle: 'Materials & lectures',
            iconAsset: 'lib/assets/Icons/courses.svg',
            accentColor: AppColors.primaryBlue,      
            accentBackground: AppColors.lightblue,  
            route: '/course',
          ),
          const ServiceItemModel(
            id: 'assessments',
            title: 'Assessments',
            subtitle: 'Grades and Participation',
            iconAsset: 'lib/assets/Icons/Assesments.svg',
            accentColor: AppColors.primaryBlue,       // amber icon
            accentBackground: AppColors.lightblue,  // light yellow bg
            route: '/assesments',
          ),
          const ServiceItemModel(
            id: 'results',
            title: 'Results',
            subtitle: 'Results & GPA',
            iconAsset: 'lib/assets/Icons/Results.svg',
            accentColor: AppColors.secondaryYellow,       // blue icon
            accentBackground: AppColors.LightYellow,  // light blue bg
            route: '/academicresults',
          ),
          const ServiceItemModel(
            id: 'exam_schedule',
            title: 'Exam Schedule',
            subtitle: 'Dates & Locations',
            iconAsset: 'lib/assets/Icons/examschedule.svg',
            accentColor: AppColors.secondaryYellow,       // amber icon
            accentBackground: AppColors.LightYellow,  // light yellow bg
            route: '/ExamScheduleScreen2',
          ),
        ],
      ),
      ServiceSectionModel(
        title: 'ADMINISTRATION',
        items: [
          const ServiceItemModel(
            id: 'registration',
            title: 'Registration',
            subtitle: 'Enroll for next semester',
            iconAsset: 'lib/assets/Icons/Registration.svg',
            accentColor: AppColors.primaryBlue,
            accentBackground: AppColors.lightblue,
            status: ServiceStatus.opened,
            route: '/Registration',
          ),
          const ServiceItemModel(
            id: 'fees',
            title: 'Fees & Payments',
            subtitle: 'Pay tuition fees',
            iconAsset: 'lib/assets/Icons/Fees.svg',
            accentColor: AppColors.secondaryYellow,
            accentBackground: AppColors.LightYellow,
            route: '/Fees',
          ),
        ],
      ),
    ];
  }
}