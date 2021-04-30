class SelectionItem {
  final String imageUrl;
  final String name;
  final String description;

  SelectionItem(this.imageUrl, this.name, {this.description});

  factory SelectionItem.fromJson(Map<String, dynamic> json) => SelectionItem(
        json["imageUrl"],
        json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "name": name,
        "description": description,
      };
}
