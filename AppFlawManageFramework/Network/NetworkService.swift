//
//  NetworkService.swift
//  AppFlawManageFramework
//
//  Created by Dev on 2021/04/20.
//

import Foundation

public struct redMindUrlComponent {
    static let uploadFileURL = "/uploads.json"
    static let createIssueURL = "/issues.json"
}

enum HTTPMethod1: String {
    case GET
    case POST
}

open class NetworkService {
    public static let shared = NetworkService()
    
    open func get(url: String?,
             parameters: [String: Any]?,
             completion: @escaping ([String: Any]?, HTTPURLResponse?, Error?) -> Void) {
        
        guard let urlRequest = request(url: url,
                                       parameters: parameters) else {
            return
        }
        
        service(urlRequest: urlRequest, completion: completion)
    }
    
    open func post(url: String?,
              parameters: [String: Any]?,
              completion: @escaping ([String: Any]?, HTTPURLResponse?, Error?) -> Void) {
        
        guard let urlRequest = request(url: url,
                                       parameters: parameters,
                                       httpMethod: HTTPMethod1.POST.rawValue) else {
            return
        }
        
        service(urlRequest: urlRequest, completion: completion)
    }
    
    private func service(urlRequest: URLRequest,
                         completion: @escaping ([String: Any]?, HTTPURLResponse?, Error?) -> Void) {
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            var responseBody: [String: Any]? = nil
            
            if let data = data {
                do {
                    responseBody = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                } catch {
                    responseBody = nil
                }
            }
            completion(responseBody, urlResponse as? HTTPURLResponse, error)
            
            }.resume()
    }
    
    private func request(url: String?,
                         parameters: [String: Any]?,
                         httpMethod: String? = HTTPMethod1.GET.rawValue) -> URLRequest? {
        
        guard let url = URL(string: url ?? "") else { return nil}
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        if let parameters = parameters {
            components?.queryItems = parameters.compactMap { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        }
        guard let requestUrl = components?.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = httpMethod
        
        return urlRequest
    }
}
