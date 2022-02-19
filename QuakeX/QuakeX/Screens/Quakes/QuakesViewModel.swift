//
//  QuakesViewModel.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/16/22.
//

import UIKit

protocol QuakesViewModelProtocol {
    var quakes : [MainModel]? { get }
    var viewBackground : UIColor { get }
    var title : String { get }
    var filter : String { get }
    func getQuakes(content: @escaping () -> Void, errorContent: @escaping (QuakeError) -> Void)
}

final class QuakesViewModel : QuakesViewModelProtocol {
    
    var filter = ""
    
    var quakes: [MainModel]? {
        model.quake?.result
    }
    
    private let model: QuakesModelProtocol
    
    
     init(model : QuakesModelProtocol = QuakesModel()) {
         self.model = model
     }

    func getQuakes(content: @escaping () -> Void, errorContent: @escaping (QuakeError) -> Void) {
        model.getQuake(content: content, errorContent: errorContent)
    }
    
    
    let title = Constants.Text.Bar.quakes
    let viewBackground = Constants.Style.Color.background
    let searchText = Constants.Text.Bar.search
    let noResultsFound = Constants.Text.Error.noResultsFound
}
