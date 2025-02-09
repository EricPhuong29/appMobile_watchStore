import 'package:flutter/cupertino.dart';
import 'package:flutter_mob/configs/images.dart';
import 'package:flutter_mob/models/account/account.dart';
import 'package:flutter_mob/models/brand/brand.dart';
import 'package:flutter_mob/models/cart/cart_item.dart';
import 'package:flutter_mob/models/filter.dart';
import 'package:flutter_mob/models/models.dart';
import 'package:flutter_mob/models/option.dart';
import 'package:flutter_mob/models/watch/watch.dart';
import 'package:flutter_mob/storage/sharedpreferences/shared_preferences_manager.dart';
import 'package:flutter_mob/models/notify/notification.dart' as model;

@immutable
class Constants {
  /* Routing Names */
  static const String splashScreen = '/splash';
  static const String onBoardingScreen = '/on-boarding';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';
  static const String dashBoardScreen = '/dashboard-screen';
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String watchDetailScreen = '/watch-detail-screen';
  static const String detailOrderScreen = '/detail-order-screen';
  static const String profileScreen = '/profile-screen';
  static const String changePasswordScreen = '/change-password-screen';
  static const String notifyScreen = '/notify-screen';
  static const String detailNotifyScreen = '/detail-notify-screen';
  static const String orderScreen = '/order-screen';
  static const String transactionScreen = '/transaction-screen';
  static const String allTopDeelsScreen = '/all-top-deels-screen';
  static const String allBrandScreen = '/all-brand-screen';
  static const String allOutstandingScreen = '/all-outstanding-screen';
  static const String watchByBrandScreen = '/watch-by-brand-screen';
  static const String shippingAddressScreen = '/shipping-address-screen';
  static const String newShippingAddressScreen = '/new-shipping-address-screen';
  static const String applyDiscountScreen = '/apply-discount-screen';
  static const String paymentMethodScreen = '/payment-method-screen';
  static const String webviewScreen = '/webview-screen';
  static const String filterScreen = '/filter-screen';

  static const String baseUrl =
      'https://datn-watch-store-backend.onrender.com/api/';
  static const String urlSupportCenter =
      'https://datn-watch-store-backend.onrender.com/support-center';

  static const List<WalkThrough> listWalkThroughDefault = [
    WalkThrough(
        title: "Cửa hàng đồng hồ nam cao cấp",
        content:
            "Uy tín chất lượng tạo nên thương hiệu của\nchúng tôi rất vui được đồng hành cùng các bạn",
        imagePath: AppImages.imgWalkThrough1),
    WalkThrough(
        title: "Đồng hồ cổ điển",
        content:
            "Phong cách lịch lãm, vượt thời gian. Hãy để\nnhững chiếc đồng hồ cổ điển tôn vinh sự quý phái của bạn",
        imagePath: AppImages.imgWalkThrough2),
    WalkThrough(
        title: "Dịch vụ hậu mãi",
        content:
            "Bảo hành dài hạn, chăm sóc tận tình. Chúng\ntôi luôn đồng hành cùng bạn sau khi mua hàng",
        imagePath: AppImages.imgWalkThrough3)
  ];

  static List<Option> listTabClassifyWatch = [
    Option(key: TopProductType.SALE.name, label: "Bán chạy"),
    Option(key: TopProductType.POPULAR.name, label: "Phổ biến"),
    Option(key: TopProductType.NEW.name, label: "Mới"),
    Option(key: TopProductType.COLLECTION.name, label: "Bộ sưu tập"),
  ];

  static List<Option> listTabOrders = [
    Option(key: OrderStatusType.PENDING, label: "Chờ xác nhận"),
    Option(key: OrderStatusType.SHIPPING, label: "Chờ giao hàng"),
    Option(key: OrderStatusType.DELIVERED, label: "Đã giao"),
    Option(key: OrderStatusType.CANCELLED, label: "Đã huỷ"),
  ];

  static List<Watch> listMockDataWatch = [
    Watch(
        id: '1',
        brand: mockBrand,
        name: 'Luch CH 15',
        description:
            'Đồng hồ Luch 15, một trong những thương hiệu nổi đình nổi đám và cũng là một trong những cái tên phổ biến, có sức ảnh hưởng trong giới sản xuất đồng hồ đeo tay. Với những sản phẩm chất lượng,Luch 15 ngày càng khẳng định được vị thế cũng như chỗ đứng của mình.',
        size: 24,
        createdDate: DateTime(2024, 1, 14),
        photoUrls: [
          "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/design-dc011e6b-a663-4665-a203-82df9febaf43%201.png?alt=media&token=f590cfef-19bb-4893-b541-fcc63861eb53"
        ],
        price: 3000,
        quantity: 50,
        numberPurchase: 50,
        totalSold: 50,
        listReview: []),
    Watch(
        id: '1',
        brand: mockBrand,
        name: 'Luch CH 15',
        description:
            'Đồng hồ Luch 15, một trong những thương hiệu nổi đình nổi đám và cũng là một trong những cái tên phổ biến, có sức ảnh hưởng trong giới sản xuất đồng hồ đeo tay. Với những sản phẩm chất lượng,Luch 15 ngày càng khẳng định được vị thế cũng như chỗ đứng của mình.',
        size: 24,
        createdDate: DateTime(2024, 1, 14),
        photoUrls: [
          "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/design-dc011e6b-a663-4665-a203-82df9febaf43%201.png?alt=media&token=f590cfef-19bb-4893-b541-fcc63861eb53"
        ],
        price: 3000,
        quantity: 50,
        numberPurchase: 50,
        totalSold: 50,
        listReview: []),
    Watch(
        id: '1',
        brand: mockBrand,
        name: 'Luch CH 15',
        description:
            'Đồng hồ Luch 15, một trong những thương hiệu nổi đình nổi đám và cũng là một trong những cái tên phổ biến, có sức ảnh hưởng trong giới sản xuất đồng hồ đeo tay. Với những sản phẩm chất lượng,Luch 15 ngày càng khẳng định được vị thế cũng như chỗ đứng của mình.',
        size: 24,
        createdDate: DateTime(2024, 1, 14),
        photoUrls: [
          "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/design-dc011e6b-a663-4665-a203-82df9febaf43%201.png?alt=media&token=f590cfef-19bb-4893-b541-fcc63861eb53"
        ],
        price: 3000,
        quantity: 50,
        numberPurchase: 50,
        totalSold: 50,
        listReview: []),
    Watch(
        id: '1',
        brand: mockBrand,
        name: 'Luch CH 15',
        description:
            'Đồng hồ Luch 15, một trong những thương hiệu nổi đình nổi đám và cũng là một trong những cái tên phổ biến, có sức ảnh hưởng trong giới sản xuất đồng hồ đeo tay. Với những sản phẩm chất lượng,Luch 15 ngày càng khẳng định được vị thế cũng như chỗ đứng của mình.',
        size: 24,
        createdDate: DateTime(2024, 1, 14),
        photoUrls: [
          "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/design-dc011e6b-a663-4665-a203-82df9febaf43%201.png?alt=media&token=f590cfef-19bb-4893-b541-fcc63861eb53"
        ],
        price: 3000,
        quantity: 50,
        numberPurchase: 50,
        totalSold: 50,
        listReview: [])
  ];

  static Watch mockDataWatch = Watch(
      id: '1',
      brand: mockBrand,
      name: 'Luch CH 15',
      description:
          'Đồng hồ Luch 15, một trong những thương hiệu nổi đình nổi đám và cũng là một trong những cái tên phổ biến, có sức ảnh hưởng trong giới sản xuất đồng hồ đeo tay. Với những sản phẩm chất lượng,Luch 15 ngày càng khẳng định được vị thế cũng như chỗ đứng của mình.',
      size: 24,
      createdDate: DateTime(2024, 1, 14),
      photoUrls: [
        "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/design-dc011e6b-a663-4665-a203-82df9febaf43%201.png?alt=media&token=f590cfef-19bb-4893-b541-fcc63861eb53"
      ],
      price: 3000,
      quantity: 50,
      numberPurchase: 50,
      totalSold: 50,
      listReview: []);

  static List<Watch> listMockTopDeels = [
    Watch(
        id: '1',
        brand: mockBrand,
        name: 'Unisex Casio Vintage',
        description:
            'Đồng hồ Luch 15, một trong những thương hiệu nổi đình nổi đám và cũng là một trong những cái tên phổ biến, có sức ảnh hưởng trong giới sản xuất đồng hồ đeo tay. Với những sản phẩm chất lượng,Luch 15 ngày càng khẳng định được vị thế cũng như chỗ đứng của mình.',
        size: 24,
        createdDate: DateTime(2024, 1, 14),
        photoUrls: [
          "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/thumb_1542595515%201.png?alt=media&token=2fb13746-c7c0-472e-9a83-b313796430e7"
        ],
        price: 8690,
        quantity: 50,
        numberPurchase: 50,
        totalSold: 50,
        listReview: []),
    Watch(
        id: '1',
        brand: mockBrand,
        name: 'Unisex Casio Vintage',
        description:
            'Đồng hồ Luch 15, một trong những thương hiệu nổi đình nổi đám và cũng là một trong những cái tên phổ biến, có sức ảnh hưởng trong giới sản xuất đồng hồ đeo tay. Với những sản phẩm chất lượng,Luch 15 ngày càng khẳng định được vị thế cũng như chỗ đứng của mình.',
        size: 24,
        createdDate: DateTime(2024, 1, 14),
        photoUrls: [
          "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/thumb_1542595515%201.png?alt=media&token=2fb13746-c7c0-472e-9a83-b313796430e7"
        ],
        price: 8690,
        quantity: 50,
        numberPurchase: 50,
        totalSold: 50,
        listReview: []),
    Watch(
        id: '1',
        brand: mockBrand,
        name: 'Unisex Casio Vintage',
        description:
            'Đồng hồ Luch 15, một trong những thương hiệu nổi đình nổi đám và cũng là một trong những cái tên phổ biến, có sức ảnh hưởng trong giới sản xuất đồng hồ đeo tay. Với những sản phẩm chất lượng,Luch 15 ngày càng khẳng định được vị thế cũng như chỗ đứng của mình.',
        size: 24,
        createdDate: DateTime(2024, 1, 14),
        photoUrls: [
          "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/thumb_1542595515%201.png?alt=media&token=2fb13746-c7c0-472e-9a83-b313796430e7"
        ],
        price: 8690,
        quantity: 50,
        numberPurchase: 50,
        totalSold: 50,
        listReview: []),
  ];

  static List<Brand> listMockBrands = [
    Brand(
        id: "1",
        name: "Rolex",
        description: "",
        logo:
            "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/Group%20224.svg?alt=media&token=0bc0b736-5f37-409a-9532-85218f67d2f8"),
    Brand(
        id: "2",
        name: "Patek philippe",
        description: "",
        logo:
            "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/Union.svg?alt=media&token=e80e3d89-7024-468a-b2cf-23940eeea085"),
    Brand(
        id: "3",
        name: "Audemars",
        description: "",
        logo:
            "https://firebasestorage.googleapis.com/v0/b/apolis-301dc.appspot.com/o/Union%20(1).svg?alt=media&token=131828f5-a386-4170-987f-c73694e810a0")
  ];

  static List<Review> listMockDataComment = [
    Review(
      id: '1',
      orderId: '1',
      account: mockDataAccount,
      date: DateTime.now(),
      photoUrls: [],
      rate: 5,
      comment: "Đồng hồ đẳng cấp xứng đáng để sở hữu",
    ),
  ];

  static List<CartItem> listMockCarts = [
    CartItem(id: "1", watch: mockDataWatch, quantity: 1),
    CartItem(id: "2", watch: mockDataWatch, quantity: 1),
    CartItem(id: "3", watch: mockDataWatch, quantity: 1),
  ];

  static List<OrderItem> listMockOrderItems = [
    OrderItem(id: "1", watch: mockDataWatch, quantity: 1),
    OrderItem(id: "2", watch: mockDataWatch, quantity: 1),
    OrderItem(id: "3", watch: mockDataWatch, quantity: 1),
  ];

  static Order mockDataOrder = Order(
      id: "1",
      codeOrder: "WS001",
      totalAmount: 1000,
      listOrderItem: listMockOrderItems,
      status: OrderStatusType.PENDING,
      orderDate: DateTime.now(),
      estDeliveryDate: DateTime.now());

  static Brand mockBrand = Brand(
      id: "1", name: "Orient", logo: "", description: "Thương hiệu nhật bản");

  static ShippingAddress mockDataShippingAddress = ShippingAddress(
      id: '1',
      title: 'Địa chỉ nhà',
      receiver: 'Hoàng Văn Sang',
      address: 'Số 30, ngõ 93, Vũ Hữu, Thanh Xuân, Bắc Thanh Xuân, Hà Nội',
      isDefault: true,
      phoneNumber: '(+84)968786843');

  static Account mockDataAccount = Account(
      id: "1",
      userName: "quanNQ",
      email: "quan.pn29@gmail.com",
      phoneNumber: "0911237889",
      name: "Phương Ngọc Quân",
      avatarUrl:
          "https://plus.unsplash.com/premium_photo-1690579805307-7ec030c75543?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fG1hbiUyMGF2YXRhcnxlbnwwfHwwfHx8MA%3D%3D");

  static List<model.Notification> mockListNotification = [
    model.Notification(
      id: "1",
      title: "Hot sale",
      message:
          "Đồng hồ nam Orient giảm giá sâu cho các quý ông vào dịp hè này.",
      createdAt: DateTime.now(),
      isRead: false,
      type: NotificationType.EVENT.name,
    ),
    model.Notification(
      id: "2",
      title: "Tin tức",
      message: "Seiko vừa cho ra mắt sản phảm mới.",
      createdAt: DateTime.now(),
      isRead: false,
      type: NotificationType.EVENT.name,
    ),
    model.Notification(
      id: "3",
      title: "Khuyến mãi",
      message: "Giảm giá lên đếm 30% dành cho các đồng hồ cơ từ 5 triệu đồng.",
      createdAt: DateTime.now(),
      isRead: false,
      type: NotificationType.EVENT.name,
    ),
  ];

  static List<Filter> mockListSizeWatch = [
    Filter(title: "Dưới 29 mm", querySize: QuerySize(endSize: 29)),
    Filter(
        title: "29 - 33 mm", querySize: QuerySize(startSize: 29, endSize: 33)),
    Filter(
        title: "33 - 37 mm", querySize: QuerySize(startSize: 33, endSize: 37)),
    Filter(
        title: "37 - 40 mm", querySize: QuerySize(startSize: 37, endSize: 40)),
    Filter(
        title: "40 - 42 mm", querySize: QuerySize(startSize: 40, endSize: 42)),
    Filter(
        title: "42 - 45 mm", querySize: QuerySize(startSize: 42, endSize: 45)),
    Filter(title: "Trên 45 mm", querySize: QuerySize(startSize: 45)),
  ];

  static List<Filter> mockListWireMaterial = [
    Filter(title: "Kim loại", wire: "METAL"),
    Filter(title: "Da tổng hợp", wire: "SKIN"),
    Filter(title: "Nhựa", wire: "PLASTIC"),
    Filter(title: "Vải", wire: "FABRIC"),
  ];

  static List<Filter> mockListFactoryMaterial = [
    Filter(title: "Cơ tự động", factory: "AUTOMATIC_MECHANICAL"),
    Filter(title: "Pin", factory: "BATTERY"),
    Filter(title: "Năng lượng mặt trời", factory: "LIGHT_ENERGY"),
  ];

  static String getStatusOrder(String status) {
    switch (status) {
      case OrderStatusType.PENDING:
        return "Chờ xác nhận";
      case OrderStatusType.SHIPPING:
        return "Chờ giao hàng";
      case OrderStatusType.DELIVERED:
        return "Đã giao";
      case OrderStatusType.CANCELLED:
        return "Đã huỷ";
      default:
        return "Trạng thái không xác định";
    }
  }

  static const Map<String, String> authRequestHeaders = {
    'Content-type': 'application/json',
    'Accept': '*/*',
  };

  static const Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<Map<String, String>> requestHeadersToken() async {
    var token = SharedPrefManager().getString(SharedPrefManager.tokenKey);
    Map<String, String> _requestHeaders = {
      'Content-type': 'application/json',
      'Authorization': token!
    };
    return _requestHeaders;
  }
}

/* define String Names */
class StringName {
  static const String logout = 'Đăng xuất';
  static const String watchShop = 'WATCH SHOP';
  static const String skip = 'Bỏ qua';
  static const String next = 'Tiếp';
  static const String getStarted = 'Bắt đầu';
  static const String login = 'Đăng Nhập';
  static const String login1 = 'Đăng nhập';
  static const String account = 'Tài khoản';
  static const String fillYourAccount = 'Nhập tài khoản của bạn';
  static const String fillYourAddress = 'Nhập địa chỉ của bạn';
  static const String password = 'Mật khẩu';
  static const String confirmPassword = 'Xác nhận mật khẩu';
  static const String fillYourPassword = 'Nhập mật khẩu của bạn';
  static const String forgotPassword = 'Quên mật khẩu?';
  static const String notHaveAccount = 'Bạn chưa có tài khoản?';
  static const String signUp = 'Đăng ký';
  static const String email = 'Email';
  static const String phone = 'Số điện thoại';
  static const String hadAccount = 'Bạn đã có tài khoản?';
  static const String fillYourEmail = 'Nhập email của bạn';
  static const String fillYourPhone = 'Nhập số điện thoại của bạn';
  static const String hello = 'Xin chào!';
  static const String pickWatchThatYouWant =
      'Hãy chọn chiếc đồng hồ mà bạn muốn';
  static const String outstandingWatch = 'Sản phẩm nổi bật';
  static const String all = 'Tất cả';
  static const String searchBrand = 'Tìm kiếm thương hiệu';
  static const String topDeels = 'Giá trị cao';
  static const String sizeWatch = 'Đường kính mặt';
  static const String wireMaterial = 'Chất liệu dây';
  static const String factoryMaterial = 'Loại máy';
  static const String priceRange = 'Khoảng giá (\$)';
  static const String search = 'Tìm kiếm';
  static const String searchResult = 'Kết quả tìm kiếm';
  static const String searchNotFound = 'Không thấy kết quả';
  static const String addToCart = 'Thêm vào giỏ hàng';
  static const String comment = 'Bình luận:';
  static const String noComment = 'Chưa có bình luận';
  static const String noOrder = 'Chưa có đơn hàng';
  static const String noTransaction = 'Chưa có giao dịch';
  static const String noNotify = 'Chưa có thông báo';
  static const String hasError = 'Đã có lỗi xảy ra';
  static const String reason = 'Lí do:';
  static const String commentProduct = 'Nhận xét:';
  static const String cart = 'Giỏ hàng';
  static const String subtotal = 'Tổng tiền';
  static const String transport = 'Vận chuyển';
  static const String voucher = 'Mã khuyến mãi';
  static const String free = 'Free';
  static const String total = 'Thành tiền';
  static const String discount = 'Giảm giá';
  static const String payment = 'Thanh toán';
  static const String newAddress = 'Thêm Địa Chỉ Mới';
  static const String agree = 'Đồng ý';
  static const String notAddProducts = 'Chưa thêm sản phẩm';
  static const String orderInformation = 'Thông tin đơn hàng';
  static const String filter = 'Lọc';
  static const String listShippingAddress = 'Chọn địa chỉ nhận hàng';
  static const String selectVoucher = 'Chọn Voucher';
  static const String selectPaymentMethod = 'Chọn Phương Thức Thanh Toán';
  static const String newShippingAddress = 'Địa chỉ mới';
  static const String updateShippingAddress = 'Cập nhật địa chỉ';
  static const String deliveryAddress = 'Địa chỉ nhận hàng';
  static const String paymentMethod = 'Phương thức thanh toán';
  static const String paymentOnDelivery = 'Thanh toán khi nhận hàng';
  static const String paymentViaVNPay = 'Thanh toán qua VNPay';
  static const String codeOrders = 'Mã đơn hàng';
  static const String orderDate = 'Thời gian đặt hàng';
  static const String estimatedDeliveryTime = 'Thời gian giao hàng dự kiến';
  static const String address = 'Địa chỉ';
  static const String confirmOrder = 'Xác nhận đơn hàng';
  static const String complete = 'Hoàn thành';
  static const String deleteAddress = 'Xoá địa chỉ';
  static const String accountInfo = 'Thông tin tài khoản';
  static const String notification = 'Thông báo';
  static const String detailNotification = 'Chi tiết thông báo';
  static const String order = 'Đơn hàng';
  static const String transactionHistories = 'Lịch sử giao dịch';
  static const String supportCenter = 'Trung tâm trợ giúp';
  static const String personalInformation = 'Thông tin cá nhân';
  static const String changePassword = 'Đổi mật khẩu';
  static const String update = 'Cập nhật';
  static const String updateOrder = 'Cập nhật đơn hàng';
  static const String inputOldPassword = 'Nhập mật khẩu cũ';
  static const String inputNewPassword = 'Nhập mật khẩu mới';
  static const String inputConfirmNewPassword = 'Xác nhận lại mật khẩu';
  static const String change = 'Thay đổi';
  static const String cancelOrder = 'Huỷ';
  static const String evaluate = 'Đánh giá';
  static const String apply = 'Áp dụng';
  static const String evaluated = 'Đã đánh giá';
  static const String send = 'Gửi';
  static const String listOrder = 'Đơn hàng';
  static const String viewDetail = 'Xem chi tiết';
  static const String totalPayment = 'Tổng Thanh Toán:';
  static const String codeOrder = 'Mã đơn hàng';
  static const String confirm = 'Xác nhận';
  static const String cancel = 'Huỷ';
  static const String loginError = 'Lỗi đăng nhập';
  static const String signupError = 'Lỗi đăng ký';
  static const String notAllowEmpty = 'Không được để trống!';
  static const String notSamePassword = 'Mật khẩu không trùng khớp!';
  static const String emailNotValid = 'Email không hợp lệ!';
  static const String passwordNotMatch = 'Mật khẩu không trùng khớp!';
  static const String signupSuccess = 'Đăng ký thành công';
  static const String loginNow = 'Bạn có muốn đăng nhập ngay?';
  static const String name = 'Họ tên';
  static const String note = 'Ghi chú';

  //type
  static const String AUTOMATIC_MECHANICAL_TYPE = "AUTOMATIC_MECHANICAL";
  static const String BATTERY_TYPE = "BATTERY";
  static const String LIGHT_ENERGY_TYPE = "LIGHT_ENERGY";

  static const String METAL_TYPE = "METAL";
  static const String SKIN_TYPE = "SKIN";
  static const String PLASTIC_TYPE = "PLASTIC";
  static const String FABRIC_TYPE = "FABRIC";
}

/* define String Names */
class DateFormat {
  static const String dateHour = 'dd-MM-yyyy HH:mm';
  static const String date = 'dd-MM-yyyy';
  static const String expirationDiscount = 'dd.MM.yyyy';
}

class Regex {
  static const email = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
}

enum DiscountType { PERCENT, PERMANENT }

enum PaymentMethodType { CASH, VNPAY }

enum NotificationType { PROMOTION, EVENT, UPDATE }

enum TopProductType { SALE, POPULAR, NEW, COLLECTION, PRICE }

enum UpdateCartTypeEnum { PLUS, MINUS }

class OrderStatusType {
  static const String PROCESSING = "PROCESSING";
  static const String PENDING = "PENDING";
  static const String SHIPPING = "SHIPPING";
  static const String DELIVERED = "DELIVERED";
  static const String CANCELLED = "CANCELLED";
}
