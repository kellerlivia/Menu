//
//  MenuProfile.swift
//  Menu
//
//  Created by Livia Carvalho Keller on 29/11/22.
//

import Foundation

// MARK: - MenuProfileGroup

struct MenuProfileGroup: Codable {
    var group: [MenuProfile]?
}

// MARK: - MenuProfile

struct MenuProfile: Codable {
    var title: String?
    var child: [Item]?
}

// MARK: - Item

struct Item: Codable {
    var title: String?
}

