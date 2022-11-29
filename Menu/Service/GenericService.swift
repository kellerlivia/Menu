//
//  GenericService.swift
//  Menu
//
//  Created by Livia Carvalho Keller on 29/11/22.
//

import Foundation
import Alamofire

protocol GenericService {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}
