//
//  OrderStatus.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 19.01.23.
//

import Foundation


enum OrderStatus: String {
    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case completed = "Выполнен"
    case cancelled = "Отменен"
}
