//
//  ProductViewModel.swift
//  MVVMPractice
//
//  Created by Essa on 13/06/2024.
//

import Foundation
enum EventHandler {
    case dataLoading
    case dataLoaded
    case dataStopLoading
    case message(_ error : Error)
}

class ProductViewModel {
    
    var product : [Products] = []
    var eventHandler : ((_ event : EventHandler) -> Void)?
    
    func getProducts() {
        self.eventHandler?(.dataLoading)
        APIManager.shared.getRequest(modelType: [Products].self, endpointType:EndPointItem.product , completion:{ response in
            self.eventHandler?(.dataStopLoading)
            switch response {
            case .success(let products):
                self.product = products
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.message(error))
            }
        })
    }
}
