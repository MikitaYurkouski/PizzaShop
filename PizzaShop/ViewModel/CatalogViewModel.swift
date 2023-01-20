//
//  CatalogViewModel.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 10.01.23.
//

import Foundation

class CatalogViewModel: ObservableObject {
    
    static let shared = CatalogViewModel()
    
    
    var popularProducts = [
        Product(id: "1",
                title: "Маргарита Гурмэ",
                imageUrl: "Not found",
                price: 450,
                description: "Cамая дешевая пицца"),
        
        Product(id: "2",
                title: "Маргарита",
                imageUrl: "Not found",
                price: 350,
                description: "Cамая дешевая пицца"),
        Product(id: "3",
                title: "Пепперони",
                imageUrl: "Not found",
                price: 550,
                description: "Cамая дешевая пицца"),
        Product(id: "4",
                title: "Гавайская",
                imageUrl: "Not found",
                price: 450,
                description: "Cамая дешевая пицца"),
        Product(id: "5",
                title: "Диабло",
                imageUrl: "Not found",
                price: 620,
                description: "Cамая дешевая пицца"),
        ]
    
    var pizzas = [
        Product(id: "1",
                title: "Маргарита Гурмэ",
                imageUrl: "Not found",
                price: 450,
                description: "Cамая дешевая пицца"),
        
        Product(id: "2",
                title: "Маргарита",
                imageUrl: "Not found",
                price: 350,
                description: "Cамая дешевая пицца"),
        Product(id: "3",
                title: "Пепперони",
                imageUrl: "Not found",
                price: 550,
                description: "Cамая дешевая пицца"),
        Product(id: "4",
                title: "Гавайская",
                imageUrl: "Not found",
                price: 450,
                description: "Cамая дешевая пицца"),
        Product(id: "5",
                title: "Диабло",
                imageUrl: "Not found",
                price: 620,
                description: "Cамая дешевая пицца"),
        ]
}
