//
//  Catalog.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 10.01.23.
//

import SwiftUI

struct CatalogView: View {
    
    let layout = [GridItem(.adaptive(minimum: screen.width / 2.4))]
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Section("Популярные") {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: layout, spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) {item in NavigationLink {
                            
                            let viewModel = ProductDetailViewModel(product: item)
                            
                                ProductDetailView(viewModel: viewModel)
                            } label: {
                                ProductCell(product: item)
                                    .foregroundColor(.black)
                            }

                        }
                    } .padding()
                }
            }
            
            Section("Пицца") {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: layout, spacing: 16) {
                        ForEach(CatalogViewModel.shared.popularProducts, id: \.id) {item in NavigationLink {
                            let viewModel = ProductDetailViewModel(product: item)
                            
                                ProductDetailView(viewModel: viewModel)
                        } label: {
                            ProductCell(product: item)
                                .foregroundColor(.black)
                        }
                        }
                    } .padding()
                }
            }
            
            
            
            
        }.navigationTitle(Text("Каталог"))
        //.navigationBarHidden(true)
        
        
    }
}

struct Catalog_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView()
    }
}
