//
//  APPIntentLearnApp.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import SwiftUI
import CoreSpotlight

@main
struct APPIntentLearnApp: App {
    init() {
        if (ABManager.share.useOnlineIntentIcon){
            downloadOnlineIntentImageLaunchTask()
        }else{
            EntAppIntentShortcuts.updateAppShortcutParameters()
        }
        
//        Task {
//            do {
//                var entities:[BookEntity] = []
//            
//                let model1:BookModel = BookModel(name: "xiyouji", author: "author_xiyouji",imageName: "xiyouji")
//                let model2:BookModel = BookModel(name: "hongloumeng", author: "author_hongloumeng",imageName: "hongloumeng")
//                let model3:BookModel = BookModel(name: "sanguoyanyi", author: "author_sanguoyanyi",imageName: "sanguoyanyi")
//                let model4:BookModel = BookModel(name: "shuihuzhuan", author: "author_shuihuzhuan",imageName: "shuihuzhuan")
//                entities.append(BookEntity(model: model1, id: model1.id))
//                entities.append(BookEntity(model: model2, id: model2.id))
//                entities.append(BookEntity(model: model3, id: model3.id))
//                entities.append(BookEntity(model: model4, id: model4.id))
//                try await CSSearchableIndex
//                    .default()
//                    .indexAppEntities(entities)
//            } catch {
//                print("Error: \(error.localizedDescription)")
//            }
//        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension APPIntentLearnApp {
    
    func downloadOnlineIntentImageLaunchTask (){
        let imageUrlArray:[URL] = [
            URL(string: "https://fastly.picsum.photos/id/648/200/200.jpg?hmac=Kb_qhDdDfOGevrbabLvz4Tp3fu-M7DxQE6APqQRnwVw")!,
            URL(string: "https://fastly.picsum.photos/id/469/200/200.jpg?hmac=r_nEPJ5ExnhVEQSrNc19WUPConxJzBC929FJHl_Y5N4")!,
            URL(string: "https://fastly.picsum.photos/id/927/200/200.jpg?hmac=8gJRiqNVrPAFPg0IyGTTYxaPJBSoLOVg4elvGEPV30M")!,
            URL(string: "https://fastly.picsum.photos/id/856/200/200.jpg?hmac=0i-cnhrzdHoF0g75vH6s_S8RUe5ej3nWdKiqxfYhuTo")!,
        ]
        
        let nameArray:[String] = ["xiyouji","hongloumeng","sanguoyanyi","shuihuzhuan"]
        
        for i in 0...3{
            downloadImage(name: nameArray[i], from: imageUrlArray[i]) { url in
                print("sss")
            }
        }
    }
    
    func downloadImage(name bookName:String, from url: URL, completion: @escaping (URL?) -> Void) {
        let task = URLSession.shared.downloadTask(with: url) { location, response, error in
            guard let location = location, error == nil else {
                print(error?.localizedDescription ?? "Error")
                completion(nil)
                return
            }
            do {
                let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let destinationURL = documentsURL.appendingPathComponent(bookName)
                
                if FileManager.default.fileExists(atPath: destinationURL.path()) {
                    try FileManager.default.removeItem(at: destinationURL)
                } else {
                    print("file don't exist")
                }
        
                try FileManager.default.moveItem(at: location, to: destinationURL)
                BookManager.share.appendImageUrl(bookName:bookName, imageUrl: destinationURL)
                let count:Int = BookManager.share.imageLoaclUrl.count
                if (count==4){
                    EntAppIntentShortcuts.updateAppShortcutParameters()
                }
                completion(destinationURL)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        }
        task.resume()
    }
    
}

