//
//  NetworkService.swift
//  MarvelApp
//
//  Created by Asit Aslan on 1.02.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import Foundation
import Moya

public enum NetworkService {
    case getCharacters(ofset:Int, limit:Int),
         getCharactersDetail(id: Int)
    
}

extension NetworkService: TargetType {
    public var sampleData: Data {
        return Data()
    }
    
    public var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public/")!
    }
    
    public var path: String {
        switch self {
            
        case .getCharacters:
            return "characters"
      
        case .getCharactersDetail(id: let id):
            return "characters/\(id)"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .getCharacters:
            return .get
        case .getCharactersDetail:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        
        case .getCharacters(let ofset, let limit):
            let params = ["offset": ofset,
                          "limit": limit,
                          "hash": "68402f2416beaa459dfada625471e1bd",
                          "apikey": Constants.apiKey,
                          "ts": 1] as [String: Any]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        
        case .getCharactersDetail:
            let params = ["hash": "68402f2416beaa459dfada625471e1bd",
                          "apikey": Constants.apiKey,
                          "ts": 1] as [String: Any]
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
            
        }
    }
    
    public var headers: [String : String]? {
        return ["accept": "application/json, text/plain, *"]
    }

}
