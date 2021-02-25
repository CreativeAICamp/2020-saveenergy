//
//  NetworkingService.swift
//  APIRequest2
//
//  Created by iYodjung on 23/5/20.
//  Copyright © 2020 iYodjung. All rights reserved.
//



import Foundation

enum MyResult<T, E: Error> {
    
    case success(T)
    case failure(E)
}

class NetworkingService {
     
    var imagecode: CallPredict?
    
    let baseUrl = "https://saver-bank-app.azurewebsites.net/"
    ///
    func handleResponse(for request: URLRequest,
                        completion: @escaping (Result<User, Error>) -> Void) {
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                
                print(unwrappedResponse.statusCode)
                
                switch unwrappedResponse.statusCode {
                    
                case 200 ..< 300:
                    print("success")
                    
                default:
                    print("failure")
                }
                
                if let unwrappedError = error {
                    completion(.failure(unwrappedError))
                    return
                }
                
                if let unwrappedData = data {
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: unwrappedData, options: [])
                        print(json)
                        
                        if let user = try? JSONDecoder().decode(User.self, from: unwrappedData) {
                            print ("success")
                            completion(.success(user))
                            
                        } else {
                            let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData)
                            print ("failure")
                            completion(.failure(errorResponse))
                        }
                        
                    } catch {
                        print ("Caatch")
                        completion(.failure(error))
                    }
                }
            }
        }
        
        task.resume()
    }
    
    
    func handleResponse1(for request_1: URLRequest,
                         
                         completion: @escaping (Result<CallPredict, Error>) -> Void){
        
        let session = URLSession.shared
        
        let task1 = session.dataTask(with: request_1) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                guard let unwrappedResponse = response as? HTTPURLResponse else {
                    completion(.failure(NetworkingError.badResponse))
                    return
                }
                
                print(unwrappedResponse.statusCode)
                
                switch unwrappedResponse.statusCode {
                    
                case 200 ..< 300:
                    print("success")
                    
                default:
                    print("failure")
                }
                
                if let unwrappedError = error {
                    completion(.failure(unwrappedError))
                    return
                }
                    if let unwrappedData1 = data {
                        do {
                            let json = try JSONSerialization.jsonObject(with: unwrappedData1, options: [])
                            print(json)
                            
                            if let callinfo = try? JSONDecoder().decode(CallPredict.self, from: unwrappedData1) {
                                print ("successes")
                                                            
                               // imagecode?.my64 = json
                                completion(.success(callinfo))
                                
                            } else {
                                let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: unwrappedData1)
                                print ("failure")
                                completion(.failure(errorResponse))
                            }
                            
                        } catch {
                            print ("Catch")
                            completion(.failure(error))
                        }
                    }
            }
        }
            task1.resume()
            
            
        }
        
        
        
        ///
        func request(endpoint: String,
                     parameters: [String: Any],
                     completion: @escaping (Result<User, Error>) -> Void) {
            
            guard let url = URL(string: baseUrl + endpoint) else {
                completion(.failure(NetworkingError.badUrl))
                return
            }
            
            var request = URLRequest(url: url)
            
            var components = URLComponents()
            
            var queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                
                let queryItem = URLQueryItem(name: key, value: String(describing: value))
                queryItems.append(queryItem)
            }
            
            components.queryItems = queryItems
            
            
            let queryItemData = components.query?.data(using: .utf8)
            
            request.httpBody = queryItemData
            request.httpMethod = "Post"
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            handleResponse(for: request, completion: completion)
        }
        
        ///
        
        func request_1(endpoint: String,
                       parameters: [String: Any],
                       completion: @escaping (Result<CallPredict, Error>) -> Void) {
            
            guard let url = URL(string: baseUrl + endpoint) else {
                completion(.failure(NetworkingError.badUrl))
                return
            }
            print("in request_1")
            var request = URLRequest(url: url)
            
            var components = URLComponents()
            
            var queryItems = [URLQueryItem]()
            
            for (key, value) in parameters {
                
                let queryItem = URLQueryItem(name: key, value: String(describing: value))
                queryItems.append(queryItem)
            }
            
            components.queryItems = queryItems
            
            
            let queryItemData = components.query?.data(using: .utf8)
            
            request.httpBody = queryItemData
            request.httpMethod = "Post"
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            handleResponse1(for: request, completion: completion)
            
        }
        
        
        ///
        
        func request(endpoint: String,
                     loginObject: Login,
                     completion: @escaping (Result<User, Error>) -> Void) {
            
            guard let url = URL(string: baseUrl + endpoint) else {
                completion(.failure(NetworkingError.badUrl))
                return
            }
            
            var request = URLRequest(url: url)
            
            do {
                let loginData = try JSONEncoder().encode(loginObject)
                request.httpBody = loginData
                
            } catch {
                completion(.failure(NetworkingError.badEncoding))
            }
            
            request.httpMethod = "Post"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            handleResponse(for: request, completion: completion)
        }
        
        
        
        func request_1_1(endpoint: String,
                       funcObject: Function1,
                       completion: @escaping (Result<CallPredict, Error>) -> Void) {
            
            guard let url = URL(string: baseUrl + endpoint) else {
                completion(.failure(NetworkingError.badUrl))
                return
            }
            print("in request_1_1")
            var request = URLRequest(url: url)
            
            do {
                let callPredictData = try JSONEncoder().encode(funcObject)
                request.httpBody = callPredictData
                print ("Call Predict Data Completed")
                
            } catch {
                completion(.failure(NetworkingError.badEncoding))
            }
            
            request.httpMethod = "Post"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            handleResponse1(for: request, completion: completion)
        }
        
        
        
        
    }
    enum NetworkingError: Error {
        case badUrl
        case badResponse
        case badEncoding
    }
    
    // username=kiloloco&password=pass123
    

