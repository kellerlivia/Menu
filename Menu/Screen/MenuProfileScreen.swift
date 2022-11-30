//
//  MenuProfileScreen.swift
//  Menu
//
//  Created by Livia Carvalho Keller on 30/11/22.
//

import UIKit

class MenuProfileScreen: UIView {
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        return view
    }()
    
    lazy var upArrowButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "chevron.up"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tappedBack(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Menu"
        return label
    }()
    
    @objc func tappedBack(_ sender: UIButton) {
        print(#function)
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: CGRect(), style: .grouped)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .white
        tv.separatorStyle = .none
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemPink
        self.headerView.addSubview(self.upArrowButton)
        self.headerView.addSubview(self.titleLabel)
        self.addSubview(self.headerView)
        self.addSubview(self.tableView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 40),
            
            self.upArrowButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.upArrowButton.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor),
            
            self.titleLabel.leadingAnchor.constraint(equalTo: self.upArrowButton.trailingAnchor, constant: 20),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.headerView.centerYAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
