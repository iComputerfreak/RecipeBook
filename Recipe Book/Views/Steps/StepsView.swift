//
//  StepsView.swift
//  Recipe Book
//
//  Created by Jonas Frey on 09.10.19.
//  Copyright © 2019 Jonas Frey. All rights reserved.
//

import SwiftUI

struct StepsView: View {
    
    @EnvironmentObject private var recipe: JFRecipe
    
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            HeaderView("Steps")
            Divider()
            List {
                // Steps
                // Pair the steps with their indices [(0, JFStep), (1, JFStep), ...]
                // IMPORTANT: Use .id instead of the hashsum, otherwise the views get fully re-rendered at every step text change!
                ForEach(Array(self.recipe.steps.enumerated()), id: \.1.id) { (index, step) in
                    HStack(alignment: .top) {
                        if (self.editMode?.wrappedValue.isEditing ?? false) {
                            StepEditingView(description: self.$recipe.steps[index].description)
                        } else {
                            StepView(index: index, description: step.description)
                        }
                    }
                }
                    
                .onDelete(perform: { indexSet in
                    self.recipe.steps.remove(atOffsets: indexSet)
                })
                    .onMove(perform: { (source, destination) in
                        self.recipe.steps.move(fromOffsets: source, toOffset: destination)
                    })
            }
            // Add Step
            if self.editMode?.wrappedValue.isEditing ?? false {
                Button(action: {
                    print("Adding step")
                    // FIXME: Static ID
                    self.recipe.steps.append(JFStep())
                }, label: {
                    HStack {
                        Spacer()
                        Image(systemName: "plus.circle")
                        Text("Add Step")
                        Spacer()
                    }
                })
            }
            // Push the button directly under the list
            Spacer()
        }
    }
}

struct StepsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StepsView()
                .previewLayout(.fixed(width: 400, height: 600))
                .environmentObject(Placeholder.sampleRecipes.first!)

            StepsView()
                .previewLayout(.fixed(width: 400, height: 600))
                .environmentObject(Placeholder.sampleRecipes.first!)
                .environment(\.editMode, .constant(.active))
        }
    }
}
