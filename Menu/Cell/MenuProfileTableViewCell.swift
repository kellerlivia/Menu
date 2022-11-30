//
//  MenuProfileTableViewCell.swift
//  Menu
//
//  Created by Livia Carvalho Keller on 30/11/22.
//

import UIKit

class MenuProfileTableViewCell: UITableViewCell {
    
    static let indetifier: String = "MenuProfileTableViewCell"
    let screen: MenuProfileTableViewCellScreen = MenuProfileTableViewCellScreen()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.screen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.screen)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.screen.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.screen.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.screen.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.screen.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    public func setupCell(title: String) {
        self.screen.titleLabel.text = title
    }
}
