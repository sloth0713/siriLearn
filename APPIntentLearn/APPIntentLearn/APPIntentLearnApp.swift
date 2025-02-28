//
//  APPIntentLearnApp.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import SwiftUI
import CoreSpotlight
import AppIntents
import Intents

@main
@available(iOS 18, *)
struct APPIntentLearnApp: App {
    init() {
        
//        let ff:Foo = Foo.init(string: "aa")
        if (ABManager.share.useOnlineIntentIcon){
            downloadOnlineIntentImageLaunchTask()
        }else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                _ = GYLManager.share
                EntAppIntentShortcuts.updateAppShortcutParameters()//系统bug，这个方法会子线程更新，如果此时app进后台或者被杀死，则会更新失败   <#code#>
            }
            
            self.donateIntent()
//            self.donateToCoreSpotlight()
//            self.asyncTest()
        }
        
    }
    func donateToCoreSpotlight() {
        Task {
            do {
                var entities:[BookEntity] = []

                let model1:BookModel = BookModel(name: "xiyouji", author: "author_xiyouji",imageName: "xiyouji", type: .EntityTypeBusiness)
                let model2:BookModel = BookModel(name: "hongloumeng", author: "author_hongloumeng",imageName: "hongloumeng", type: .EntityTypeBusiness)
                let model3:BookModel = BookModel(name: "sanguoyanyi", author: "author_sanguoyanyi",imageName: "sanguoyanyi", type: .EntityTypeBusiness)
                let model4:BookModel = BookModel(name: "shuihuzhuan", author: "author_shuihuzhuan",imageName: "shuihuzhuan", type: .EntityTypeBusiness)
                entities.append(BookEntity(model: model1, id: model1.id))
                entities.append(BookEntity(model: model2, id: model2.id))
                entities.append(BookEntity(model: model3, id: model3.id))
                entities.append(BookEntity(model: model4, id: model4.id))
                try await CSSearchableIndex
                    .default()
                    .indexAppEntities(entities)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func donateIntent () {
        for _ in 1...100{
//                IntentDonationManager
            let intent = SingleIntent()
            
            IntentDonationManager.shared.donate(intent: intent)
//            INInteraction(intent: intent, response: nil).donate(completion: nil)
            
            let _:IntentDonationIdentifier = intent.donate()
            
            Task {
                do {
                    try await intent.perform()
//                    let IntentDialog:ReturnsValue = try await intent.callAsFunction(donate: true)
                    print("success")
                } catch {
                    print("Error fetching data: \(error)")
                }
            }
//
//            intent.Book = BookEntity(model: BookManager.share.hongloumeng , id: BookManager.share.hongloumeng.name)
//            let id:IntentDonationIdentifier = intent.donate()
//            print(" intent.donate \(id)")
        }
    }
    
    func asyncTest () {
        for i in 1...10{
            let intent = BookAppIntent()
            Task {
                do {
                    intent.performAsync()//不async函数的话，线程仍然是主线程
                    try await intent.performError()//async方法会由系统创建一个线程
                }
                catch {//如果不catch，task剩余的代码不会被执行
                    print("Error fetching data: \(error)")
                }
                print("task after try catch")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//@available(iOS 18, *)
//public extension CSSearchableItem {
//    func associateAppEntity(
//        _ appEntity: some IndexedEntity,
//        priority: Int
//    )
//}

@available(iOS 18, *)
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
//                    EntAppIntentShortcuts.updateAppShortcutParameters()
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

