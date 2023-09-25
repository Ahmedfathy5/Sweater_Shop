//
//  ContentView.swift
//  SweaterShop
//
//  Created by Ahmed Fathi on 24/09/2023.
//

import SwiftUI

struct ContentView: View {
  @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(prodcut: product)
                            .environmentObject(cartManager)
                    }
                   
                }
                .padding(10)
            }
            .navigationTitle("Sweater Shop ")
            .toolbar {
                NavigationLink {
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products.count)
                }

                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
}
