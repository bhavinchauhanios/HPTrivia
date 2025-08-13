//
//  SelectBooks.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 12/08/25.
//

import SwiftUI

struct SelectBooks: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(Game.self) private var game
    
    private var store = Store()
    
    var activeBooks: Bool{
        for book in game.bookQuestions.books{
            if book.status == .active{
                return true
            }
        }
        return false
    }
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .background(.brown)
                .ignoresSafeArea()
                
            VStack{
                
                Text("Which books would you see questions from?")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
                
                ScrollView{
             
                    LazyVGrid(columns: [GridItem(),GridItem()]){
                        ForEach(game.bookQuestions.books){ book in
                            if book.status == .active || (book.status == .locked && store.purchased.contains(book.image)){
                              
                                ActiveBook(book: book)
                                .task{
                                    game.bookQuestions.changeStatus(of: book.id, to: .active)
                                }
                                
                                .onTapGesture {
                                    game.bookQuestions.changeStatus(of: book.id, to: .inactive)
                                }
                                
                                
                            }else if book.status == .inactive{
                                InactiveBook(book: book)

                                .onTapGesture {
                                    game.bookQuestions.changeStatus(of: book.id, to: .active)
                                }
                                
                            }else{
                                
                                    LockedBook(book: book)
                                
                                    .onTapGesture {
                                        let index = book.id - 4
                                        
                                        // Safely check that index is within the range of the products array
                                        if store.products.indices.contains(index) {
                                            let product = store.products[index]
                                            
                                            Task {
                                                await store.purchase(product)
                                            }
                                        } else {
                                            print("Invalid product index: \(index)")
                                            // Optionally show an alert or handle the error
                                        }
                                    }
                                
                            }
                        }
                    }
                }
                
                if !activeBooks{
                    Text("You must select at least 1 book.")
                        .multilineTextAlignment(.center)
                }
                
                Button("Done"){
                    game.bookQuestions.saveStatus()
                    
                    dismiss()
                }
                .font(.largeTitle)
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .foregroundStyle(.white)
                .disabled(!activeBooks)
            }
            .foregroundStyle(.black)
        }
        .interactiveDismissDisabled()
        .task {
            await store.loadProducts()
        }
    }
}

#Preview {
    SelectBooks()
        .environment(Game())
}
