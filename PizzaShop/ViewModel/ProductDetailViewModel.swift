//
//  ProductDetailViewModel.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 13.01.23.
//

import Foundation

class ProductDetailViewModel: ObservableObject {
    @Published var product: Product
    @Published var sizes = ["Маленькая", "Средняя", "Большая"]
    @Published var count = 0
    
    // Вместо этой записи, мы написали ИНИТ
//    = Product(id: "1",
//                                                          title: "Маргарита Гурмэ",
//                                                          imageUrl: "Not found",
//                                                          price: 450,
//                                                          description: "Cамая дешевая пицца")
    init(product: Product) {
        self.product = product
    }
    
    // Функция для изменения цены при выборе размера пиццы
    func getPrice(size: String) -> Int {
        
        switch size {
        case "Маленькая": return product.price
        case "Средняя": return Int(Double(product.price) * 1.25)
        case "Большая": return Int(Double(product.price) * 1.5)
        default: return 0
        }
    }
    
}
