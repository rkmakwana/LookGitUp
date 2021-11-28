//
//  NetworkClient.swift
//  LookGitUp
//
//  Created by Rashmikant Makwana on 11/29/21.
//

import Foundation

protocol APIEndpoint {
    func endpoint() -> String
}

class NetworkClient {

    enum APIError: Error {
        case unauthorised
        case invalidEndpoint
        case errorResponseDetected
        case decodingError
        case noData
    }

    // MARK: - Create URL Request

    public static func urlRequest(from request: APIEndpoint) -> URLRequest? {
        let endpoint = request.endpoint()
        guard let endpointUrl = URL(string: endpoint) else {
            return nil
        }

        let endpointRequest = URLRequest(url: endpointUrl)
        return endpointRequest
    }

    // MARK: - GET

    public static func get<R: Codable & APIEndpoint, T: Codable>(
        request: R,
        completion: @escaping ((Result<T, Error>) -> Void)) {
        guard var endpointRequest = self.urlRequest(from: request) else {
            completion(.failure(APIError.invalidEndpoint))
            return
        }
        endpointRequest.httpMethod = "GET"

        URLSession.shared.dataTask(
            with: endpointRequest,
            completionHandler: { (data, urlResponse, error) in
                DispatchQueue.main.async {
                    self.processResponse(data, urlResponse, error, completion: completion)
                }
        }).resume()
    }

    // MARK: - Process Request

    public static func processResponse<T: Codable>(
        _ dataOrNil: Data?,
        _ urlResponseOrNil: URLResponse?,
        _ errorOrNil: Error?,
        completion: @escaping ((Result<T, Error>) -> Void)) {

        if let data = dataOrNil {
            do {
                let str = String(decoding: data, as: UTF8.self)
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: Data(str.utf8))
                completion(.success(decodedResponse))
            } catch let error {
                print(error)
                completion(.failure(error))
            }
        } else {
            completion(.failure(errorOrNil ?? APIError.noData))
        }
    }
}
