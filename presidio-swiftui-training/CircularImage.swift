//
//  CircularImage.swift
//  presidio-swiftui-training
//
//  Created by Rahul R on 06/10/23.
//

import SwiftUI

struct CircularImage: View {
    var image:Image
    var body: some View {
        image
        Text("iOS")
            .font(.system(size:180))
            .fontWeight(.bold)
            .foregroundStyle(.teal.gradient)
    }
}

#Preview {
    CircularImage(image: Image(systemName: "car.fill"))
}
