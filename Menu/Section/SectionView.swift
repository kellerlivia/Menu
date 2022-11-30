//
//  SectionView.swift
//  Menu
//
//  Created by Livia Carvalho Keller on 30/11/22.
//

import UIKit

class SectionView: UIView {
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var referenceButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var arrowImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.tintColor = .orange
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(referenceButton)
        self.addSubview(arrowImageView)
        self.addSubview(descriptionLabel)
        self.addSubview(lineView)
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupSection(description: String) {
        self.descriptionLabel.text = description
    }
    
    private func configConstraints() {
        
        NSLayoutConstraint.activate([
            self.referenceButton.topAnchor.constraint(equalTo: self.topAnchor),
            self.referenceButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.referenceButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.referenceButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.arrowImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            
            self.descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            self.lineView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.lineView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
