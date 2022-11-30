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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func loadView() {
        self.screen = MenuProfileScreen()
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
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

//MARK: - MenuProfileViewModelDelegate

extension MenuProfileVC: MenuProfileViewModelDelegate {
    func success() {
        print("Deu certo!!")
    }
    
    func error(_ message: String) {
        print("Deu ruim: \(message)")
    }
}

//MARK: - Delegate e DataSource TableView

extension MenuProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionView()
        view.referenceButton.addTarget(self, action: #selector(tapSection(_:)), for: .touchUpInside)
        view.referenceButton.tag = section
        view.setupSection(description: "testeee")
        return view
    }
    
    @objc func tapSection(_ sender: UIButton) {
        print(#function)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
