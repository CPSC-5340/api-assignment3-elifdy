//
//  RecipeViewModel.swift
//  Assignment3
//
//  Created by Elif Dede on 3/31/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipesData = [RecipeDetail]()
    @Published var hasError = false
    @Published var error: RecipeModelError?
    
    private let apiKey = "a85ce6388e2d4b74ab8cc9198d9a5708"
    
  
    @MainActor
    func fetchRecipes(withIngredients ingredients: [String]) async {
        let ingredientsQueryParam = ingredients.joined(separator: ",")
        let baseUrl = "https://api.spoonacular.com/recipes/findByIngredients"
            let query = "\(baseUrl)?ingredients=\(ingredientsQueryParam)&number=10&limitLicense=true&ranking=1&ignorePantry=false&apiKey=\(apiKey)"

        
        guard let urlString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlString) else {
                  self.hasError = true
                  self.error = .urlError
                  return
              }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let results = try JSONDecoder().decode([RecipeDetail].self, from: data)
            self.recipesData = results
            self.hasError = false
            self.error = nil
        } catch {
            self.hasError = true
            self.error = .customError(error: error)
        }
    }
}

extension RecipeViewModel {
    enum RecipeModelError: LocalizedError {
        case urlError
        case decodeError
        case customError(error: Error)
        
        var errorDescription: String? {
            switch self {
            case .urlError:
                return "URL Error"
            case .decodeError:
                return "Decoding Error"
            case .customError(let error):
                return error.localizedDescription
            }
        }
    }
}

