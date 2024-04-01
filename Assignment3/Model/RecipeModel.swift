//
//  RecipeModel.swift
//  Assignment3
//
//  Created by Elif Dede on 3/31/24.
//

import Foundation
struct RecipeDetail: Codable, Identifiable {
    let id: Int
    let title: String
    let image: String
    let usedIngredientCount: Int
    let missedIngredientCount: Int
    let missedIngredients: [Ingredient]
    let usedIngredients: [Ingredient]
}

struct Ingredient: Codable, Identifiable {
    let id: Int
    let original: String
    let image: String
}
