//
//  RecipeImageCardView.swift
//  Assignment3
//
//  Created by Elif Dede on 3/31/24.
//

import SwiftUI

struct RecipeImageCardView: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)){
            image in image.resizable()
                .scaledToFit()
                .cornerRadius(10)
                .frame(width: 300, height: 300)
        } placeholder: {
            ProgressView()
        }
        
    }
}

struct RecipeImageCardView_Previews: PreviewProvider{
    static var previews: some View {
        RecipeImageCardView(url: "https://img.spoonacular.com/recipes/642582-312x231.jpg")
    }
}
