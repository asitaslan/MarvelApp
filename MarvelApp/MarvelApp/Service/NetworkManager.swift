//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by Asit Aslan on 1.02.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import Moya
import Foundation

protocol Networkable {
    typealias errorType = (Error)->()
    typealias successModel = () -> ()
    func getCharacters(ofset:Int, limit:Int, completion: @escaping(Characters) ->(), fail: @escaping errorType)
    func getCharactersDetail(id: Int, completion: @escaping(Detail) ->(), fail: @escaping errorType)
}


class NetworkManager: Networkable {
    func getCharactersDetail(id: Int, completion: @escaping (Detail) -> (), fail: @escaping errorType) {
        request(target: .getCharactersDetail(id: id)) { (result: Detail) in
            completion(result)
        } fail: { error in
            fail(error)
        }
    }

    func getCharacters(ofset: Int, limit: Int, completion: @escaping (Characters) -> (), fail: @escaping errorType) {
       request(target: .getCharacters(ofset:ofset, limit:limit)) { (result: Characters) in
            completion(result)
        } fail: { error in
            fail(error)
        }
    }
        
    let provider = MoyaProvider<NetworkService>()
    
}

private extension NetworkManager {
    
    private func request<T: Decodable>(target: NetworkService, completion: @escaping (T) -> (), fail: @escaping errorType) {
        
        print("\n[PATH]  = ", target.baseURL, target.path)
        print("\n[HEADER] = ", target.headers as Any)
        print("\n[METHOD] = ", target.method)
        print("\n[PARAMS] = ", target.task)
        
        provider.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    
                    print("\n[PATH]  = \(response.statusCode)", target.baseURL, target.path)
                    print("\n[HEADER] = ", target.headers as Any)
                    print("\n[METHOD] = ", target.method)
                    print("\n[PARAMS] = ", target.task)
                    
                    print(NSString(data: response.data,
                                   encoding: String.Encoding.utf8.rawValue) ?? "")
                    
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(results)
                    
                } catch let error {
                    print(error)
                    fail(error)
                }
            case .failure(let error):
                
                fail(error)
            }
        }
    }
    
    
}

