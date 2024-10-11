//
//  SearchEnum.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/10/11.
//

import AppIntents
import SwiftUICore


enum SearchEnum : String {
    case Art = "Art"
    case Education = "Education"
    case Science = "Science"
}

extension SearchEnum : AppEnum {
    
    static var typeDisplayRepresentation:TypeDisplayRepresentation{
        TypeDisplayRepresentation(
            name: LocalizedStringResource("Search")
        )

    }
    
    static var caseDisplayRepresentations: [SearchEnum : DisplayRepresentation] = [
        .Art : DisplayRepresentation(title: LocalizedStringResource("Art"), image: DisplayRepresentation.Image(systemName: "heart")),
        
        .Education : DisplayRepresentation(title: LocalizedStringResource("Education"), image: DisplayRepresentation.Image(systemName: "graduationcap")),
        
        .Science : DisplayRepresentation(title: LocalizedStringResource("Science"), image: DisplayRepresentation.Image(systemName: "atom")),
        
    ]
    
}
