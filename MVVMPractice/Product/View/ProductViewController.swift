//
//  ProductViewController.swift
//  MVVMPractice
//
//  Created by Essa on 13/06/2024.
//

import UIKit

class ProductViewController: UIViewController {

    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeEvent()
    }
    
    func observeEvent() {
        viewModel.getProducts()
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            switch event {
            case .dataLoading: break
            case .dataStopLoading: break
            case .dataLoaded:
                print(self.viewModel.product)
            case .message(let error):
                print(error)
            }
        }
    }
}
