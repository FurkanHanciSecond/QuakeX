//
//  ResultRouter.swift
//  QuakeX
//
//  Created by Furkan Hanci on 1/24/22.
//

import Foundation

enum MainModelRouter : RouterProtocol  {
    
    private static let baseurl = Constants.baseUrl
    
    case getDataFromMainModel
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return MainModelRouter.baseurl ?? ""
    }
    
    var path: String {
        switch self {
        case .getDataFromMainModel:
            return "/deprem/live.php?limit=100"
        }
    }
    
    var headers: [HTTPHeader] {
         switch self {
         default:
           return []
         }
       }

       var parameters: [String: Any] {
         switch self {
         default:
           return [:]
         }
       }

       var parameterEncoding: ParameterEncoding {
         switch self {
         default:
           return .url
         }
       }

       var method: HTTPMethod {
         switch self {
         case .getDataFromMainModel:
           return .get
         }
       }
    
    
    
}
