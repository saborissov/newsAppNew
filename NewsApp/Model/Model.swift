//
//  Model.swift
//  NewsApp
//
//  Created by Mac on 05.04.2020.
//  Copyright © 2020 Mac. All rights reserved.

import Foundation

var articles: [Article] = []

var urlToData:URL{
    let path = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask,true)[0]+"/data.json"
    let urlPath = URL(fileURLWithPath: path)
    return urlPath
}

func loadNews(completionHandler:(()->Void)?){
    let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=6a57ae5177ce4015bb8953fa5be45e74")
    let session = URLSession(configuration: .default)
    
    let downloadTask = session.downloadTask(with: url!) { (urlFile, response, error) in
        if urlFile != nil {
            
            try? FileManager.default.copyItem(at: urlFile!, to: urlToData)
            parseNews()
            completionHandler?()

        }
    }
    downloadTask.resume()
}


func parseNews(){
    
    let data = try? Data(contentsOf: urlToData)
    
    if data == nil{
        return
    }
    
    
    let rootDirectoryAny = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
    if rootDirectoryAny == nil{
        return
    }
    
    let rootDirectory = rootDirectoryAny as? Dictionary<String, Any>
    if rootDirectory == nil{
        return
    }
    
    
    
    if let array = rootDirectory!["articles"] as? [Dictionary<String, Any>]{
        
        var returnArray: [Article]=[]
        
        for dict in array{
            let newArticle = Article(dictionary: dict)
            returnArray.append(newArticle)
            
        }
        articles = returnArray
    }
}
