//
//  Collection.swift
//  RijksMuseumArt
//
//  Created by Markandaiya Harsha on 26/08/18.
//  Copyright © 2018 markandaiya. All rights reserved.
//

import Foundation

class CollectionCaller:NSObject {
    var pageNumber = 0
    var arrayList:[Art] = []
    
    func getArtList(completion:rnBlankComplition)->Void{
       // gets list of art collections from server
        let url = "https://www.rijksmuseum.nl/api/en/collection?key=4NniIOvP&format=json&imgonly=True&p=\(pageNumber)&ps=20"
        let headers = RNApiSupport.getHeaderForApiCall(headers: [:])
        RNApiSupport.getDataForDecodable(forURLString: url, headers:headers , completion: { (data) in
            
            self.pageNumber += 1
            if let resposneData = data {
                do{
                    let decoder = JSONDecoder()
                    let collection:Collection = try decoder.decode(Collection.self, from: resposneData)
                    self.arrayList.append(contentsOf: collection.artObjects)
                    dlPrint(object: self.arrayList)
                }
                catch let jsonError {
                    dlPrint(object: jsonError.localizedDescription)
                }
            }
            else {
                // no data came along
            }
        }) { (error) in
            
        }
    }
}

struct Collection: Decodable {
    var artObjects:[Art] = []
    enum codingKeys:String,Decodable {
        case artObjects
    }
    
}

struct Art:Decodable {
    var id:String
    var title:String
    var webImage:imageModal
    var headerImage:imageModal
}

struct imageModal:Decodable {
    var guid:String
    var url:String
}



