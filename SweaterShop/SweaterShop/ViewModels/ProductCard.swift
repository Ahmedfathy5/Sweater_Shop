//
//  ProductCard.swift
//  SweaterShop
//
//  Created by Ahmed Fathi on 24/09/2023.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager : CartManager
    var prodcut: Product
    var body: some View {
        ZStack(alignment: .topTrailing) {
            
            ZStack(alignment: .bottom) {
                Image(prodcut.image)
                    .resizable()
                    .cornerRadius( 20)
                    .frame(width: 180)
                    .scaledToFit()
               VStack(alignment: .leading) {
                   Text(prodcut.name)
                       .bold()
                   Text("\(prodcut.price)$")
               }
               .padding()
               .frame(width: 180, alignment: .leading)
               .background(.ultraThinMaterial)
               .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
        .shadow(radius: 3)
            Button {
               cartManager.addToCart(product: prodcut)
            } label: {
                 Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(prodcut: productList[0])
            .environmentObject(CartManager())
    }
}
