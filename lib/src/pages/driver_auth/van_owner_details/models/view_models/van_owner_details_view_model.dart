class VanOwnerDetailsViewModel {
  final String message;

  const VanOwnerDetailsViewModel({required this.message});

  factory VanOwnerDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      VanOwnerDetailsViewModel(message: json['message']);
}
