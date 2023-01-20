//
//  PositioCell.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 13.01.23.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    
    var body: some View {
        
        HStack {
            Text(position.product.title)
            .fontWeight(.bold)
            
            Spacer()
            
            Text("\(position.count) шт.")
            Text("\(position.cost) ₽.")
                .frame(width: 85, alignment: .trailing)
        } .padding(.horizontal, 16)
    }
}

struct PositioCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(
            position: Position(id: UUID().uuidString,
                                       product: Product(id: UUID().uuidString,
                                                        title: "Маргарита ГурмЭ",
                                                        imageUrl: "pizzaPH",
                                                        price: 350,
                                                        description: "Временное описание"),
                                                        count: 3))
    }
}
