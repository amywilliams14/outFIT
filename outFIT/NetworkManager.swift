//
//  NetworkManager.swift
//  outFIT
//
//  Created by Amy Williams on 12/2/21.
//

import Foundation
import Alamofire

class NetworkManager {
    static let endpoint = "https://outfithackchallenge.herokuapp.com/api"
    
    static func getTops(completion: @escaping ([Clothes]) -> Void) {
        AF.request("\(endpoint)/tops/", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let topsResponse = try? jsonDecoder.decode([Clothes].self, from: data) {
                    let tops = topsResponse
                    completion(tops)
                    print("I ran here")
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    static func getBottoms(completion: @escaping ([Clothes]) -> Void) {
        AF.request("\(endpoint)/bottoms/", method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let bottomsResponse = try? jsonDecoder.decode([Clothes].self, from: data) {
                    let bottoms = bottomsResponse
                    completion(bottoms)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
