//
//  NetworkService.swift
//  BreweriesList
//
//  Created by Alex Kiritsa on 27.10.2020.
//

import Foundation

protocol Networking {
    func request(path: String, params: [String: String]?, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: Networking {

    func request(path: String, params: [String: String]?, completion: @escaping (Data?, Error?) -> Void) {
        let url = self.url(from: path, params: params)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, _, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }

    private func url(from path: String, params: [String: String]?) -> URL {
        var components = URLComponents()

        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        if let params = params {
            components.queryItems = params.map({ URLQueryItem(name: $0, value: $1)})
        }
        return components.url!
    }
}
