//
//  WebService.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation

class WebService {
    
    enum WebServiceError : Error {
        case noResponse
        case badStatus(_ status: Int)
        case noData
        case parsing
    }
    
}
