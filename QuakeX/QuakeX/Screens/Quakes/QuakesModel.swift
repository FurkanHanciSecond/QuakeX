//
//  QuakesModel.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/16/22.
//

import UIKit

protocol QuakesModelProtocol {
    var quake : Welcome? { get set }
    func getQuake(content: @escaping () -> Void , errorContent : @escaping (QuakeError) -> Void)
}


class QuakesModel : QuakesModelProtocol {
    var quake: Welcome?
    
    private let service : QuakeServiceDelegate = ServiceClient()

    
    func getQuake(content: @escaping () -> Void, errorContent: @escaping (QuakeError) -> Void) {
        service.QuakeRequest(router: MainModelRouter.getDataFromMainModel, decodingType: Welcome.self) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.quake = data
                    
                    content()
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    errorContent(error)
                }
            }
        }
    }
    
    
}
