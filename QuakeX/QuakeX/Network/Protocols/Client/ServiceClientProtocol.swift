//
//  ServiceClientProtocol.swift
//  QuakeX
//
//  Created by Furkan Hanci on 1/24/22.
//

import Foundation

protocol QuakeServiceDelegate {
    func QuakeRequestWithData(router : RouterProtocol , completion : @escaping (Result<Data , QuakeError>) -> Void)
    func QuakeRequest<K: Codable>(router: RouterProtocol, decodingType: K.Type, completion: @escaping (Result<K, QuakeError>) -> Void)
}
