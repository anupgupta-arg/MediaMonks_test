//
//  TypicodeAPICall.swift
//  MediaMonks
//
//  Created by Anup Gupta on 10/05/21.
//

import Foundation
import Alamofire

class TypicodeAPICall {
    
    func getUserPosts(isSuccess: @escaping (Bool, UsersPosts?) -> ()) {
        let url = BASE_URL + POSTS;
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30.0
        manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).response {
            response in
            print("response.response",response.response!);
            
            switch response.result {
            
            case .success :
                print("Success");
                if response.response?.statusCode == 200, let data = response.data {
                    
                    do {
                        let decoder = JSONDecoder();
                        let usersPost = try decoder.decode(UsersPosts.self, from: data);
                        // print("UsersPost >> ",usersPost);
                        isSuccess(true, usersPost)
                    }catch let error{
                        
                        print("ERRROR >>", error);
                        isSuccess(false, nil)
                    }
                }
                else{
                    isSuccess(false, nil)
                }
                
            case .failure:
                print("Failure");
                isSuccess(false, nil)
                
            }
            
        }
    }
    
    func getAlbums(isSuccess: @escaping (Bool, Albums?) -> ()) {
        let url = BASE_URL + ALBUMS;
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30.0
        manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).response {
            response in
            print("response.response",response.response!);
            
            switch response.result {
            
            case .success :
                print("Success");
                if response.response?.statusCode == 200, let data = response.data {
                    
                    do {
                        let decoder = JSONDecoder();
                        let albums = try decoder.decode(Albums.self, from: data);
                        // print("UsersPost >> ",usersPost);
                        isSuccess(true, albums)
                    }catch let error{
                        
                        print("ERRROR >>", error);
                        isSuccess(false, nil)
                    }
                }
                else{
                    isSuccess(false, nil)
                }
                
            case .failure:
                print("Failure");
                isSuccess(false, nil)
                
            }
            
        }
    }
    
    func getPhotos(isSuccess: @escaping (Bool, UsersPosts?) -> ()) {
        let url = BASE_URL + POSTS;
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30.0
        manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).response {
            response in
            print("response.response",response.response!);
            
            switch response.result {
            
            case .success :
                print("Success");
                if response.response?.statusCode == 200, let data = response.data {
                    
                    do {
                        let decoder = JSONDecoder();
                        let usersPost = try decoder.decode(UsersPosts.self, from: data);
                        // print("UsersPost >> ",usersPost);
                        isSuccess(true, usersPost)
                    }catch let error{
                        
                        print("ERRROR >>", error);
                        isSuccess(false, nil)
                    }
                }
                else{
                    isSuccess(false, nil)
                }
                
            case .failure:
                print("Failure");
                isSuccess(false, nil)
                
            }
            
        }
    }
    
    func getTodos(isSuccess: @escaping (Bool, UsersPosts?) -> ()) {
        let url = BASE_URL + POSTS;
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30.0
        manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).response {
            response in
            print("response.response",response.response!);
            
            switch response.result {
            
            case .success :
                print("Success");
                if response.response?.statusCode == 200, let data = response.data {
                    
                    do {
                        let decoder = JSONDecoder();
                        let usersPost = try decoder.decode(UsersPosts.self, from: data);
                        // print("UsersPost >> ",usersPost);
                        isSuccess(true, usersPost)
                    }catch let error{
                        
                        print("ERRROR >>", error);
                        isSuccess(false, nil)
                    }
                }
                else{
                    isSuccess(false, nil)
                }
                
            case .failure:
                print("Failure");
                isSuccess(false, nil)
                
            }
            
        }
    }
    
    func getUsers(isSuccess: @escaping (Bool, UsersPosts?) -> ()) {
        let url = BASE_URL + POSTS;
        
        let manager = Alamofire.Session.default
        manager.session.configuration.timeoutIntervalForRequest = 30.0
        manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).response {
            response in
            print("response.response",response.response!);
            
            switch response.result {
            
            case .success :
                print("Success");
                if response.response?.statusCode == 200, let data = response.data {
                    
                    do {
                        let decoder = JSONDecoder();
                        let usersPost = try decoder.decode(UsersPosts.self, from: data);
                        // print("UsersPost >> ",usersPost);
                        isSuccess(true, usersPost)
                    }catch let error{
                        
                        print("ERRROR >>", error);
                        isSuccess(false, nil)
                    }
                }
                else{
                    isSuccess(false, nil)
                }
                
            case .failure:
                print("Failure");
                isSuccess(false, nil)
                
            }
            
        }
    }
    
}
