//
//  MenuProfileVC.swift
//  Menu
//
//  Created by Livia Carvalho Keller on 29/11/22.
//

import UIKit

class MenuProfileVC: UIViewController {
    
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
        viewModel.delegate(self)
        viewModel.fetch(.request)
    }
}

extension MenuProfileVC: MenuProfileViewModelDelegate {
    func success() {
        print("Deu certo!!")
    }
    
    func error(_ message: String) {
        print("Deu ruim: \(message)")
    }
}
