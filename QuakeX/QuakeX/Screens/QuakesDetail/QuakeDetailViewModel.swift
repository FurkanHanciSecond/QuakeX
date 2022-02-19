//
//  QuakeDetailViewModel.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/19/22.
//

import UIKit

protocol QuakeDetailViewModelProtocol {
    //TODO: Put Protocol variables
    var viewBackground : UIColor { get }
    var quakes : MainModel? { get set }
    var welcome : Welcome? { get }
    func getData(content : @escaping () -> Void , errorContent : @escaping (QuakeError) -> Void)
}

final class QuakeDetailViewModel : QuakeDetailViewModelProtocol {
    var welcome: Welcome? {
        model.datas
    }
    
    var quakes: MainModel?
    
    private let model : QuakeDetailModelProtocol
    
    init(mainModel : MainModel? , model: QuakeDetailModelProtocol = QuakeDetailModel()) {
        self.model = model
        self.quakes = mainModel
    }
    
    func getData(content: @escaping () -> Void, errorContent: @escaping (QuakeError) -> Void) {
        model.getData(content: content, errorContent: errorContent)
    }
    
    
    //MARK: Constants
    let viewBackground = Constants.Style.Color.background
    
}
