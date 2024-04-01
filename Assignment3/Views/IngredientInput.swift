//
//  IngredientInput.swift
//  Assignment3
//
//  Created by Elif Dede on 3/31/24.
//

import SwiftUI

struct IngredientInput: View {
    @StateObject var viewModel = RecipeViewModel()
    @State private var ingredient1 = ""
    @State private var ingredient2 = ""
    
    var body: some View {
        ZStack {
            Image("backgroundImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            Color.black.opacity(0.2).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Recipe Finder")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                    .padding(.horizontal)
                    .padding(10)
                
                
                Text("Enter ingredients you have and find the best recipes for your next meal")
                    .font(.title)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.black.opacity(0.6)))
                    .padding(.horizontal)
                    .padding(30)
                
             
                TextField("Ingredient 1", text: $ingredient1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(5)
                    .fixedSize()
                    .padding(.horizontal)

                TextField("Ingredient 2", text: $ingredient2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(5)
                    .fixedSize()
                    .padding(.horizontal)
                
                NavigationLink(destination: RecipeList(recipesvm: viewModel)) {
                    Text("Search")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.black.opacity(0.5))
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    Task {
                        await viewModel.fetchRecipes(withIngredients: [ingredient1, ingredient2].filter { !$0.isEmpty })
                    }
                })
            }
            .padding()
        }
    }
}


struct IngredientInput_Previews: PreviewProvider {
    static var previews: some View {

        IngredientInput()
    }
}
