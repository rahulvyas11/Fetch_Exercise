//
//  APIStandard.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/15/24.
//

import Foundation

class APIStandard {
    static func get(url: String, onSuccess: @escaping (Data) -> (), onError: @escaping (Error) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                if let errorData = error {
                    onError(errorData)
                }
                return
            }
            
            onSuccess(data)
        }
        task.resume()
    }
}
