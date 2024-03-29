import 'package:cunstruction_helper/features/shop/screens/searching_result/pages/searching%20page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarContainer extends StatefulWidget {
  final Widget resultPage;
  const SearchBarContainer({Key? key, required this.resultPage})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarContainer> {
  final TextEditingController _searchController = TextEditingController();
  bool isHovered = false;

  void _onSearchPressed() {
    String searchTerm = _searchController.text;
    // Navigate to the search results page with the search term
    Get.to(() => widget.resultPage);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() {
        isHovered = false;
      }),
      child: Container(
        decoration: BoxDecoration(
          color: isHovered
              ? const Color.fromARGB(255, 242, 248, 255)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: _onSearchPressed,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
