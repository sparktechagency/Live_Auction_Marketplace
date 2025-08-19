import 'package:get/get.dart';
import 'package:live_auction_marketplace/infrastructure/utils/app_images.dart';

class HomeController extends GetxController {
  var items = <Map<String, dynamic>>[].obs;
  RxInt selectedButtonIndex = 0.obs;

  List<Map<String, dynamic>> buttonData = [
    {'buttonName': 'For You'},
    {'buttonName': 'Electronics'},
    {'buttonName': 'Kids'},
    {'buttonName': 'Video Games'},
  ];

  // Loading state
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadInitialItems();
  }

  void loadInitialItems() {
    items.value = [
      {
        'imageUrl': AppImages.product1, // Add your image URLs here
        'title': 'Best Electronics 2025,Start with Free Delivery',
        'isLive': true,
        'viewerCount': 34,
        'shopName': 'Jirah Shop',
        'ownerPic': AppImages.productOwner,
      },
      {
        'imageUrl': AppImages.product2,
        'title': 'Best Electronics 2025,Start with Free Delivery',
        'isLive': true,
        'viewerCount': 64,
        'shopName': 'Jirah Shop',
        'ownerPic': AppImages.productOwner,
      },
      {
        'imageUrl': AppImages.product3,
        'title': 'Best Electronics 2025,Start with Free Delivery',
        'isLive': true,
        'viewerCount': 19,
        'shopName': 'Jirah Shop',
        'ownerPic': AppImages.productOwner,
      },
      {
        'imageUrl': AppImages.product4,
        'title': 'Best Electronics 2025,Start with Free Delivery',
        'isLive': true,
        'viewerCount': 64,
        'shopName': 'Jirah Shop',
        'ownerPic': AppImages.productOwner,
      },
    ];
  }

  void loadMoreItems() {
    if (isLoading.value) return;

    isLoading.value = true;

    Future.delayed(const Duration(milliseconds: 800), () {
      final newItems = [
        {
          'imageUrl': AppImages.product1, // Add your image URLs here
          'title': 'Best Electronics 2025,Start with Free Delivery',
          'isLive': true,
          'viewerCount': 34,
          'shopName': 'Jirah Shop',
          'ownerPic': AppImages.productOwner,
        },
        {
          'imageUrl': AppImages.product2,
          'title': 'Best Electronics 2025,Start with Free Delivery',
          'isLive': true,
          'viewerCount': 64,
          'shopName': 'Jirah Shop',
          'ownerPic': AppImages.productOwner,
        },
        {
          'imageUrl': AppImages.product3,
          'title': 'Best Electronics 2025,Start with Free Delivery',
          'isLive': true,
          'viewerCount': 19,
          'shopName': 'Jirah Shop',
          'ownerPic': AppImages.productOwner,
        },
        {
          'imageUrl': AppImages.product4,
          'title': 'Best Electronics 2025,Start with Free Delivery',
          'isLive': true,
          'viewerCount': 64,
          'shopName': 'Jirah Shop',
          'ownerPic': AppImages.productOwner,
        },
      ];

      items.addAll(newItems);
      isLoading.value = false;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
