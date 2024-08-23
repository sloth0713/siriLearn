//
//  EntAppIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//
import AppIntents

struct BookAppIntent: AppIntent {
    
    static var title: LocalizedStringResource { "Book App Intent" }

    //用户选择后自动赋值
    @Parameter(title: "Book Name")
    var Book: BookEntity

    func perform() async throws -> some IntentResult & ReturnsValue<BookEntity> & OpensIntent{
        print("name : \(Book.model.name), author : \(Book.model.author)")
        return .result(
            value: Book,
            opensIntent: NextBookIntent(paramsBook: $Book)
        )
    }
}

struct NextBookIntent: AppIntent {
    
    @Parameter(title: "paramsBook")
    var paramsBook: BookEntity
    
    static var title: LocalizedStringResource { "Next Book App Intent" }

    func perform() async throws -> some IntentResult{
        print("Next Book App Intent! name : \(paramsBook.model.name), author : \(paramsBook.model.author)")
        
        return .result()
    }
}
