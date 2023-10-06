//
//  AsyncImage.swift
//  presidio-swiftui-training
//
//  Created by Rahul R on 06/10/23.
//

import SwiftUI

extension Image{
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.red)
            .opacity(0.5)
            
    }
}

struct AsyncImageExample: View {
    private let imageUrl: String="https://credo.academy/credo-academy@3x.png"
    var body: some View {
        // async image with scale
//        AsyncImage(url: URL(string:imageUrl), scale: 2)
        
        // async image with custom placeholder
//        AsyncImage(url: URL(string:imageUrl)){
//            image in image.imageModifier()
//        } placeholder: {
//            Image(systemName: "photo.circle.fill").iconModifier()
//        }
//        .padding(40)
        
        // Async image with
        AsyncImage(url: URL(string:imageUrl)){ phase in
            if let image = phase.image {
                image.imageModifier() // Displays the loaded image.
            } else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            } else {
                Image(systemName: "photo.circle.fill").iconModifier() // Acts as a placeholder.
            }
        }
        .padding(40)
    }
}

#Preview {
    AsyncImageExample()
}
