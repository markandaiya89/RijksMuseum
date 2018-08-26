//
//  RNAPISupport.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 25/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import Foundation

typealias rnListComplitionHandler = (Data?) -> ()
typealias rnFailedHandler = (NSError?) -> ()

let kHTTPNoData = "No data"



class RNApiSupport: NSObject {
    
    

    
    //MARK: For Api Header
    
    class func getHeaderForApiCall(headers: [String:String]) -> [String:String]{
        var headerDict = headers
        headerDict["Content-Type"] = "application/json"
        return headerDict
    }
    
    //MARK: Decodable Api call
    class func makeRequestForLists(forURLString strURL: String,AndHeaders headers: [String:String]?, compltion: rnListComplitionHandler?, failed:rnFailedHandler?) {
        
        makeRequest(forURLString: strURL, parameter: nil, AndHeaders: headers, method: "GET", compltion: compltion, failed: failed)
    }

    
 
    
    
    class func getDataForDecodable(forURLString strURL:String,headers: [String:String],completion:rnListComplitionHandler?, failed:rnFailedHandler?)
    {
        makeRequestForLists(forURLString: strURL, AndHeaders: headers, compltion: { (data) in
            completion?(data)
        }) { (error) in
            failed?(error as NSError?)
        }
    }
    
    
    
    
    class func handleDataResponse(data: Data?, complition: rnListComplitionHandler?, failed: rnFailedHandler?) {
        
        guard let data = data, data.count > 0  else {
            failed?(NSError(domain: kHTTPNoData, code: -159, userInfo: [NSLocalizedDescriptionKey: "No data to parse"]))
            return
        }
         complition?(data)
     }
    
    class func makeRequest(forURLString strURL: String,parameter encodedData:Data?,AndHeaders headers: [String:String]?,method httpMethod:String? ,compltion: rnListComplitionHandler?, failed:rnFailedHandler?) {
        
        let url: NSURL = NSURL(string: strURL)!
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session:  URLSession = URLSession(configuration: config)
        
        let request = NSMutableURLRequest(url: url as URL)
        
        request.httpMethod = httpMethod ?? "GET"
        request.timeoutInterval = 100
        
        
        
        for (headerKey, headerValue) in headers!
        {
            request.addValue(headerValue, forHTTPHeaderField: headerKey)
        }
        if let bodyData = encodedData
        {
            request.httpBody = bodyData
        }
            
        
        let task: URLSessionTask = session.dataTask(with: request as URLRequest) { (responseData, response, responseError) in
            if responseError != nil
            {
                failed?(responseError! as NSError)
            }
            else
            {
                if let httpUrlResponse = response as? HTTPURLResponse
                {
                    let responseCode = httpUrlResponse.statusCode
                    if responseCode == 200{
                        handleDataResponse(data: responseData, complition: compltion, failed: failed)
                    }
                    else
                    {
                        guard let data = responseData, data.count > 0  else {
                            failed?(NSError(domain: "response failure", code: responseCode, userInfo: [NSLocalizedDescriptionKey:errorMessageForErrorCode(code:responseCode)]))
                            return
                        }
                        
                       
                        
                        failed?(NSError(domain: "response failure", code: responseCode, userInfo: [NSLocalizedDescriptionKey:errorMessageForErrorCode(code:responseCode)]))
                    }
                }
                else{
                    failed?(NSError(domain: "response failure", code: 0, userInfo: [NSLocalizedDescriptionKey:"No Response Header"]))
                }
            }
        }
        task.resume()
    }
    //MARK: For Api Header
    class func errorMessageForErrorCode(code:Int)->String{
        switch code {
        case 400:
            return "Error code \(code): Bad Request formed"
        case 404:
            return "Error code \(code): Detail Not Found"
        case 500:
            return "Error code \(code): Internal server error"
        default:
            return "Error code \(code): Something went wrong"
        }
    }
}
