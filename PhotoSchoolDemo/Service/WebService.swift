//
//  WebService.swift
//  PhotoSchoolDemo
//
//  Created by Tim Beals on 4/30/20.
//  Copyright © 2020 Tim Beals. All rights reserved.
//

import Foundation

//MARK: WebService
class WebService {
    
    enum WebServiceError : Error {
        case invalidResponse
        case statusCode(_ status: Int)
        case noData
        case parsing
    }

    func validate(_ data: Data, _ response: URLResponse) throws -> Data {
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw WebServiceError.invalidResponse
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw WebServiceError.statusCode(httpResponse.statusCode)
        }
        
        return data
    }
    
}
