//
//  RouterProtocol.swift
//  QuakeX
//
//  Created by Furkan Hanci on 1/24/22.
//

import Foundation

protocol RouterProtocol {
    typealias Parameters = [String : Any]
    var host: String { get }
    var path : String { get }
    var method: HTTPMethod { get }
    var scheme : String { get }
    var headers : [HTTPHeader] { get }
    var parameters: Parameters { get }
    var parameterEncoding : ParameterEncoding { get }
    func withURLRequest() throws -> URLRequest
}

extension RouterProtocol {
    func withURLRequest() throws -> URLRequest {
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        //MARK: So Importnant
        component.queryItems = [URLQueryItem(name: "limit", value: "100")]
        component.path = path
        
        if parameterEncoding == .url {
            component.queryItems = parameters.map({ (key , value) in
                return URLQueryItem(name: key, value: String(describing: value))
            })
            
        }
        
        guard let url = component.url else {
            throw QuakeError.urlError
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = method.rawValue
        
        headers.forEach { urlRequest.addValue($0.value, forHTTPHeaderField: $0.field) }
        
        switch parameterEncoding {
        case .json:
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            
        default:
            break;
            
        }
        
        return urlRequest
    }
    
      
}
