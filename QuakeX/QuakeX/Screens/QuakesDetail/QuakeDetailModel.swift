//
//  QuakeDetailModel.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/19/22.
//

import UIKit

protocol QuakeDetailModelProtocol {
    var datas : Welcome? { get set }
    func getData(content : @escaping () -> Void , errorContent : @escaping (QuakeError) -> Void)
}

class QuakeDetailModel : QuakeDetailModelProtocol {
    
    var datas: Welcome?
    let service : QuakeServiceDelegate = ServiceClient()
    
    func getData(content: @escaping () -> Void, errorContent: @escaping (QuakeError) -> Void) {
        service.QuakeRequest(router: MainModelRouter.getDataFromMainModel, decodingType: Welcome.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.datas = data
                content()
                
            case .failure(let error):
                errorContent(error)
            }
        }
    }
    
}
