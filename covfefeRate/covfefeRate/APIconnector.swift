//
//  APIconnector.swift
//  covfefeRate
//
//  Created by Garrett Battaglia on 3/7/18.
//  Copyright © 2018 Garrett Battaglia. All rights reserved.
//

import UIKit

class APIconnector {
    var _url:URL
    var _urlRequest: URLRequest
    var _session: URLSession
    var _task: URLSessionTask!
    var _toRet: NSArray!
    
    init(url: URL) {
        _url = url;
        _urlRequest = URLRequest(url: url)
        _session = URLSession.shared
        _task = nil
        _toRet = nil
    }
    convenience init(url: String){
        self.init(url: URL(string: url)!)
    }
    func getArray()->NSArray{
        _task = _session.dataTask(with: _urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                if let array = try JSONSerialization.jsonObject(with: responseData, options: [])
                    as? NSArray{
                    for var obj in array{
                        if let dict = obj as? NSDictionary{
                            obj = dict
                        }
                    }
                    self._toRet = array
                }
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        _task.resume()
        return _toRet
    }
    
}
