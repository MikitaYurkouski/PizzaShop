//
//  ProductCell.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 10.01.23.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    
    var body: some View {
        
        VStack(spacing: 2) {
            Image("pizzaPH")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: screen.width * 0.45)
                .clipped()
               // .cornerRadius(6)
            HStack {
                Text(product.title)
                    .font(.custom("AvenirNext-regular", size: 12))
                Spacer()
                Text("\(product.price) ₽")
                    .font(.custom("AvenirNext-bold", size: 12))
            }
                .padding(.horizontal, 6)
                .padding(.bottom, 6)
        }
            .frame(width: screen.width * 0.45, height: screen.width * 0.55)
            .background(.white)
            .cornerRadius(16)
            .shadow(radius: 4)
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1", title: "Маргарита Гурмэ", imageUrl: "Not found", price: 450, description: "Cамая дешевая пицца"))
    }
}
