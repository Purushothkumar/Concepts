//
//  ProductModel.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 24/06/24.
//


// MARK: - ProductModel
struct ProductModel: Codable {
    var statusCode: Int?
    var message: String?
    var data: DataClass?
    var errors: Errors?
}

// MARK: - DataClass
struct DataClass: Codable {
    var products: [Product]?
    var title, description: String?
}

// MARK: - Product
struct Product: Codable {
    var id: Int?
    var uid, slug, name, unitSellingPrice: String?
    var unitPrice, brand: String?
    var mainImage: String?
    var productDiscount: Int?
    var isWishlist: Bool?
    var warrantyInYears, category: String?
    var image1, image2, image3, image4: String?
    var image5: String?
    var demoVideo, cmVideo: String?
    var isEmiAvailable, isWarrantyAvailable, isReturnAvailable: Bool?
    var description: String?
    var returnPeriod: Int?
    var subCategory: String?
}

// MARK: - Errors
struct Errors: Codable {
}
