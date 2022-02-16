//
//  String+Ext.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/16/22.
//

import Foundation

extension CharacterSet {
    func escape(string: String) -> String {
        let allowedCharacters = string.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: ":=\"#%/<>?@\\^`{|}").inverted) ?? ""
        return allowedCharacters
    }
}
