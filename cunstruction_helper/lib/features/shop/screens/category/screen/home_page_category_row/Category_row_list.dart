// Import necessary packages and files
import 'package:cunstruction_helper/features/shop/screens/category/controller/getAllCategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../common/widgets/categories_image_text/vertical_image_text_home.dart';
import '../../../searching_result/searching_result_model_page.dart';
import '../../model/Category_model.dart';
import '../display_categories/Category_card/allemployees_per_category.dart';

// Create a StatelessWidget named CategoryRow
class CategoryRow extends StatelessWidget {
  // Instantiate a CategoryController for fetching categories
  final CategoryController categoryController = CategoryController();

  // Constructor for the CategoryRow widget
  CategoryRow({super.key});

  // Build method for constructing the widget
  @override
  Widget build(BuildContext context) {
    // Use FutureBuilder to asynchronously fetch a list of CategoryModel
    return FutureBuilder<List<CategoryModel>>(
      future: categoryController
          .fetchCategories(), // Fetch categories using the CategoryController
      builder: (context, snapshot) {
        // Check the connection state for loading, and show a loading indicator if waiting.until get data show CircularProgressIndicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        // Check for errors, and display an error message if there's an error
        else if (snapshot.hasError) {
          print('${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        }
        // If there are no errors, display the ListView with fetched data
        else {
          // Extract the list of CategoryModel from the snapshot data
          final List<CategoryModel> categories = snapshot.data!;

          // Return a horizontal ListView of TVerticalImageTextCategories
          return SizedBox(
            width: double.infinity,
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (_, index) {
                // Display each category using the TVerticalImageTextCategories widget
                return TVerticalImageTextCategories(
                  image: categories[index].image,
                  title:
                      '${categories[index].title} ${categories[index].title}',
                  onTap: () {
                    // goto  according category Details display page.
                    Get.to(() => AllEmployeesPerCategory(
                        categories: categories, categoryIndex: index));
                  }, // Specify the onTap callback (currently empty)
                );
              },
            ),
          );
        }
      },
    );
  }
}
