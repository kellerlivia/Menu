//
//  MenuProfileViewModel.swift
//  Menu
//
//  Created by Livia Carvalho Keller on 29/11/22.
//

import UIKit

enum TypeFetch {
    case mock
    case request
}

class MenuProfileViewModel{
    
    private let service: MenuProfileService = MenuProfileService()
    
    public func fetch(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            self.service.getMenuFromJson { success, error in
                print(success)
            }
        case .request:
            break
        }
    }
}
