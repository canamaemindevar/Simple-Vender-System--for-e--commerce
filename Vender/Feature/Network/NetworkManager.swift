//
//  NetworkManager.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//


import Alamofire
import Foundation


protocol ProductManagerProtocol {
    func fethAllPosts(onSuccess: @escaping (ModelElementArray) -> Void, onFail: @escaping (String?) -> Void)
}
protocol NewProductManagerProtocol{
    func sendingNewProduct(product:ModelElement)
}

enum UrlPath: String {
   case USERS = "users"
}

extension UrlPath {

    func withBaseUrl() -> String {
        return "https://denemerest-52901-default-rtdb.firebaseio.com/\(self.rawValue).json"
    }
}

struct ProductManagerService: ProductManagerProtocol {
    func fethAllPosts(onSuccess: @escaping (ModelElementArray) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(UrlPath.USERS.withBaseUrl(), method: .get).validate().responseDecodable(of: ModelElementArray.self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}

struct NewProductManagerService: NewProductManagerProtocol{
    static let shared = NewProductManagerService()
    func sendingNewProduct(product: ModelElement) {
        let headers: HTTPHeaders = [
            .contentType("application/json; charset=utf-8")
        ]
        AF.request(UrlPath.USERS.withBaseUrl(),
                   method: .post, parameters: product,
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response{ response in
            debugPrint(response)
        }
    }
    
    
}


