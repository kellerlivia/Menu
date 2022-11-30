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
        self.screen?.setupDelegateTableView(delegate: self, dataSource: self)
        self.screen?.tableView.reloadData()
    }
    
    func error(_ message: String) {
        print("Deu ruim: \(message)")
    }
}

//MARK: - Delegate e DataSource TableView

extension MenuProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionView()
        view.referenceButton.addTarget(self, action: #selector(tapSection(_:)), for: .touchUpInside)
        view.referenceButton.tag = section
        view.setupSection(description: self.viewModel.titleForSection(section))
        view.expandButton(value: self.viewModel.constainsSection(section))
        return view
    }
    
    @objc func tapSection(_ sender: UIButton) {
        let section = sender.tag
        if self.viewModel.constainsSection(section) {
            self.viewModel.tappedSection(type: .remove, section: section)
            self.screen?.insertRowsTableView(indexPath: self.viewModel.indexPathForSection(section), section: section)
        } else {
            self.viewModel.tappedSection(type: .insert, section: section)
            self.screen?.deleteRowsTableView(indexPath: self.viewModel.indexPathForSection(section), section: section)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuProfileTableViewCell.indetifier, for: indexPath) as? MenuProfileTableViewCell
        cell?.setupCell(title: viewModel.titleCell(indexPath))
        return cell ?? UITableViewCell()
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
