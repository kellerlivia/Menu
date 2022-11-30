//
//  MenuProfileVC.swift
//  Menu
//
//  Created by Livia Carvalho Keller on 29/11/22.
//

import UIKit

class MenuProfileVC: UIViewController {
    
    let viewModel: MenuProfileViewModel = MenuProfileViewModel()
    var screen: MenuProfileScreen?
    
    override func loadView() {
        self.screen = MenuProfileScreen()
        self.view = self.screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
