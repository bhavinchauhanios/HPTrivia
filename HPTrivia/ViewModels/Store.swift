//
//  Store.swift
//  HPTrivia
//
//  Created by Bhavin Chauhan on 13/08/25.
//

import StoreKit

@MainActor
@Observable
class Store{
    
    var products : [Product] = []
    var purchased = Set<String>()
    
    private var update : Task<Void, Never>? = nil
    
    init(){
        update = wathcForUpdates()
    }
    //Loade available products
    func loadProducts() async{
        do{
            products = try await Product.products(for: ["hp4", "hp5", "hp6", "hp7"])
            products.sort{
                $0.displayName < $1.displayName
            }
        }catch{
            print("Unable to load products: \(error)")
        }
    }
    
    //Purchase a product
    func purchase(_ product: Product) async{
        do{
            let result = try await product.purchase()
            switch result {
                //Purchase successfully!, But now we need to verified or not for purchase product
            case .success(let verificationResult):
                        
                switch verificationResult {
                case .unverified(let signedType, let verificationError):
                    print("Error on:\(signedType): \(verificationError)")
                case .verified(let signedType):
                    purchased.insert(signedType.productID)
                    await signedType.finish()
                }
                //User cancelled purchase product
            case .userCancelled:
                break
                
                //Waiting for some sort of approval
            case .pending:
                break
                
            @unknown default:
                break
            }
            
        }catch{
            print("Unable to purchase product: \(error)")
        }
    }
    
    //Check for purchase products
    private func checkPurchased() async{
        for product in products {
            guard let status = await product.currentEntitlement else { continue }
            
            switch status {
            case .unverified(let signedType, let verificationError):
                print("Error on:\(signedType): \(verificationError)")
            case .verified(let signedType):
                
                if signedType.revocationDate == nil{
                    purchased.insert(signedType.productID)
                }else{
                    purchased.remove(signedType.productID)
                }
                
            }
            
        }
    }
    
    
    // Connect with app store to watch for purchase and transaction updates
    
    private func wathcForUpdates() -> Task<Void, Never> {
        
        Task(priority: .background) {
            for await _ in Transaction.updates{
                await checkPurchased()
            }
        }
    }
    
}
