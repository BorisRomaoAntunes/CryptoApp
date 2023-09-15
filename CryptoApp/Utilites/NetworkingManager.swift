//
//  Networkingmanager.swift
//  CryptoApp
//
//  Created by Boris R on 12/09/23.
//

import Foundation
import Combine

class NetworkingManager{
    
    enum networkError: LocalizedError{
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String?{
            switch self{
            case .badURLResponse(url: let url): return " [🔥] bad Response from URL \(url)"
            case .unknown: return " [⚠️] Unknown error occurred"
            }
        }
    }
    
    static func download(url: URL) ->AnyPublisher<Data, Error>{
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos:  .default))
            .tryMap({ try handleURLResponse(output: $0, url: url)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw networkError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print("DEU RUIM \(error.localizedDescription)")
        }
    }
}
