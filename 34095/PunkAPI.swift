//
//   PunkAPI.swift
//  34095
//
//  Created by jose on 05/12/17.
//  Copyright © 2017 jose. All rights reserved.
//


import Foundation

class PunkAPI {
    
    private static let API_URL = "https://api.punkapi.com/v2/beers"
    
    static func getBeers(onComplete: @escaping (_ success: [Beer]?)->()){
        
        
        guard let url = URL(string: API_URL) else {
            onComplete(nil)
            return
            
        }
        
        let Urlsession = URLSession(configuration: URLSessionConfiguration.default)
        
        let Urlrequest = URLRequest(url: url)
        
        let task = Urlsession.dataTask(with: Urlrequest) { (
            data: Data?, response: URLResponse?, error: Error?) in
            
            if error != nil {
                print("Deu ruim ao criar: ", error!.localizedDescription)
                
                onComplete(nil)
            }
            else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    do {
                        
                        
                        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                        
                        
                        var beers: [Beer] = []
                        
                        for beerItem in json {
                            
                            let id = beerItem ["id"] as! Int
                            let imageURL = beerItem["image_url"] as? String
                        
                            
                            let name = beerItem["name"] as? String
                            let tag = beerItem["tagline"] as? String ?? ""
                            let abv = beerItem["abv"] as? Float ?? 0.0
                            let ibu = beerItem["ibu"] as? Float ?? 0.0
                            let description = beerItem["description"] as? String ?? ""
                            
                            
                            if (imageURL != nil && name != nil) {
                                let beer = Beer(id: id,
                                                name: name!,
                                                tag: tag,
                                                description: description,
                                                imageURL: imageURL!,
                                                abv: abv,
                                                ibu: ibu)
                                
                                beers.append(beer)
                                
                                
                                
                                
                            }
                        }
                        onComplete(beers)
                    }
                    catch {
                        print(error.localizedDescription)
                        onComplete(nil)
                    }
                }
                else {
                    print("Deu Ruim em: ", response.statusCode)
                    onComplete(nil)
                }
            }
            
        }
        task.resume()
    }
}

