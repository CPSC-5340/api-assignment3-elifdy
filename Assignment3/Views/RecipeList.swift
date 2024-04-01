//
//  RecipeList.swift
//  Assignment3
//
//  Created by Elif Dede on 3/31/24.
//

import SwiftUI

struct RecipeList: View {
    @ObservedObject var recipesvm: RecipeViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(recipesvm.recipesData) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        Text(recipe.title)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Recipes")
            .alert(isPresented: $recipesvm.hasError) {
                Alert(title: Text("Error"), message: Text(recipesvm.error?.localizedDescription ?? "Unknown error"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {

        RecipeList(recipesvm: RecipeViewModel())
    }
}
