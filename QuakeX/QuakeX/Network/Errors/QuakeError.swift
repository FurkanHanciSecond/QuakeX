//
//  QuakeError.swift
//  QuakeX
//
//  Created by Furkan Hanci on 1/24/22.
//

import Foundation

enum QuakeError: String , Error {
    case genericError = "Generic Error"
    case decodingError = "Decoding Error"
    case responseError = "Response Error"
    case dataError = "Data Error"
    case urlError = "Invalid URL"
}
