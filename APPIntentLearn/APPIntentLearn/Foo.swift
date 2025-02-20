//
//  Foo.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2025/2/20.
//


protocol StringConstructible {
    func ainit(string: String)
}

class superFoo {
//    init(string: String) {
//        super.init()
//        // ...
//    }
    var supParam:Int
    
    init() {
        self.supParam = 10
    }
}


class Foo: superFoo,StringConstructible {
    func ainit(string: String) {
        
    }
    var param:Int
    
    init(string: String) {
        self.param = 20
        super.init()
        print (self.supParam)
//        super.init()
//        self.param = self.supParam
        print("20")
    }
}
