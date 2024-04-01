//
//  RecipeDetailView.swift
//  Assignment3
//
//  Created by Elif Dede on 3/31/24.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: RecipeDetail
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RecipeImageCardView(url: recipe.image)
                    .padding(.horizontal)
                Text(recipe.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
               
                Text("Ingredients").font(.title)
                    .padding(20)
                ForEach(recipe.usedIngredients) { ingredient in
                        HStack {
                            AsyncImage(url: URL(string: ingredient.image)) { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fit)
                                     .frame(width: 60, height: 60)
                            } placeholder: {
                                ProgressView()
                            }
                            Text(ingredient.original)
                        }
                    }
                ForEach(recipe.missedIngredients) { ingredient in
                        HStack {
                            AsyncImage(url: URL(string: ingredient.image)) { image in
                                image.resizable()
                                     .aspectRatio(contentMode: .fit)
                                     .frame(width: 60, height: 60)
                            } placeholder: {
                                ProgressView()
                            }
                            Text(ingredient.original)
                        }
                    }
                
                }
                
            }
        }
    }

