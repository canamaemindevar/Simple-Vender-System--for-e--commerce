//
//  NetworkManager.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//


import Alamofire


protocol ProductManagerProtocol {
    func fethAllPosts(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void)
}

enum UrlPath: String {
    case POSTS = "/posts"
}

extension UrlPath {

    func withBaseUrl() -> String {
        return "https://jsonplaceholder.typicode.com\(self.rawValue)"
    }
}

struct ProductManagerService: ProductManagerProtocol {
    func fethAllPosts(onSuccess: @escaping ([PostModel]) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(UrlPath.POSTS.withBaseUrl(), method: .get).validate().responseDecodable(of: [PostModel].self) { (response) in
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
