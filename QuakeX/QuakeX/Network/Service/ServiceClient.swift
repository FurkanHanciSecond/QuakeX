//
//  ServiceClient.swift
//  QuakeX
//
//  Created by Furkan Hanci on 1/24/22.
//

import Foundation

final class ServiceClient : QuakeServiceDelegate {
    
    
    func QuakeRequest<K>(router: RouterProtocol, decodingType: K.Type, completion: @escaping (Result<K, QuakeError>) -> Void) where K : Decodable, K : Encodable {
        
        let request : URLRequest
        
        do {
            request = try router.withURLRequest()
        } catch  {
            completion(.failure(error as! QuakeError))
            return
        }
        
        NetworkLog.log(request: request)
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, err in
            guard err == nil else {
                completion(.failure(.genericError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.genericError))
                return
            }
            
            guard response.statusCode == HTTPStatus.success.rawValue else {
                NetworkLog.log(response: response, error: err)
                completion(.failure(.responseError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(K.self, from: data)
                
                NetworkLog.log(response: response, model: model, error: err)
                
                DispatchQueue.main.async {
                    completion(.success(model))
                }
                
            } catch {
                completion(.failure(.decodingError))
                print(err)
            }


        }
        
        .resume()
        
    }
    
    func QuakeRequestWithData(router: RouterProtocol, completion: @escaping (Result<Data, QuakeError>) -> Void) {
        let request : URLRequest
        
        do {
            request = try router.withURLRequest()
        } catch  {
            completion(.failure(error as! QuakeError))
            return
        }
        
        NetworkLog.log(request: request)
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, err in
            guard err == nil else {
                completion(.failure(.genericError))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(.genericError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            NetworkLog.log(response: response, model: data, error: err)
            completion(.success(data))


        }
        
        .resume()
    }


}
