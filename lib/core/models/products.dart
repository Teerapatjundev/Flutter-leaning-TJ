class AssetModel {
  final String assetId;
  final String assetNameTh;
  final String assetNameEn;
  final String imageUrl;
  final String assetTypeId;
  final String assetTypeNameTh;
  final String assetTypeNameEn;
  final String assetTypeCode;
  final int position;
  final String fileLocalUrl;
  final int mediaSizeQty;
  final String mediaTypeCode;
  final String mediaZipUrl;
  final int mediaZipSizeQty;

  AssetModel({
    required this.assetId,
    required this.assetNameTh,
    required this.assetNameEn,
    required this.imageUrl,
    required this.assetTypeId,
    required this.assetTypeNameTh,
    required this.assetTypeNameEn,
    required this.assetTypeCode,
    required this.position,
    required this.fileLocalUrl,
    required this.mediaSizeQty,
    required this.mediaTypeCode,
    required this.mediaZipUrl,
    required this.mediaZipSizeQty,
  });

  // Factory method to create a Product object from a database row (Map<String, dynamic>)
  factory AssetModel.fromMap(Map<String, dynamic> map) {
    return AssetModel(
      assetId: map['assetId'] ?? '',
      assetNameTh: map['assetNameTh'] ?? '',
      assetNameEn: map['assetNameEn'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      assetTypeId: map['assetTypeId'] ?? '',
      assetTypeNameTh: map['assetTypeNameTh'] ?? '',
      assetTypeNameEn: map['assetTypeNameEn'] ?? '',
      assetTypeCode: map['assetTypeCode'] ?? '',
      position: map['position'] ?? 0, // Default to 0 if position is null
      fileLocalUrl: map['fileLocalUrl'] ?? '',
      mediaSizeQty:
          map['mediaSizeQty'] ?? 0, // Default to 0 if mediaSizeQty is null
      mediaTypeCode: map['mediaTypeCode'] ?? '',
      mediaZipUrl: map['mediaZipUrl'] ?? '',
      mediaZipSizeQty:
          map['mediaZipSizeQty'] ??
          0, // Default to 0 if mediaZipSizeQty is null
    );
  }

  // Convert a Product object to a map (for database insertion or updates)
  Map<String, dynamic> toMap() {
    return {
      'assetId': assetId,
      'assetNameTh': assetNameTh,
      'assetNameEn': assetNameEn,
      'imageUrl': imageUrl,
      'assetTypeId': assetTypeId,
      'assetTypeNameTh': assetTypeNameTh,
      'assetTypeNameEn': assetTypeNameEn,
      'assetTypeCode': assetTypeCode,
      'position': position,
      'fileLocalUrl': fileLocalUrl,
      'mediaSizeQty': mediaSizeQty,
      'mediaTypeCode': mediaTypeCode,
      'mediaZipUrl': mediaZipUrl,
      'mediaZipSizeQty': mediaZipSizeQty,
    };
  }

  // Convert an Asset object to JSON-like map for printing or serialization
  Map<String, dynamic> toJson() {
    return {
      'assetId': assetId,
      'assetNameTh': assetNameTh,
      'assetNameEn': assetNameEn,
      'imageUrl': imageUrl,
      'assetTypeId': assetTypeId,
      'assetTypeNameTh': assetTypeNameTh,
      'assetTypeNameEn': assetTypeNameEn,
      'assetTypeCode': assetTypeCode,
      'position': position,
      'fileLocalUrl': fileLocalUrl,
      'mediaSizeQty': mediaSizeQty,
      'mediaTypeCode': mediaTypeCode,
      'mediaZipUrl': mediaZipUrl,
      'mediaZipSizeQty': mediaZipSizeQty,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
