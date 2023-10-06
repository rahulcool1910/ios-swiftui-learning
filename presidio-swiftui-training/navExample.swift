//
//  navExample.swift
//  presidio-swiftui-training
//
//  Created by Rahul R on 06/10/23.
//

import SwiftUI

struct Car:Identifiable, Hashable{
    let name:String
    let id = NSUUID().uuidString
}

struct navExample: View {
    var cars:[Car]=[
        .init(name: "Benz"),
        .init(name: "Ferrari"),
        .init(name: "Lamborgini"),
        
    ]
    var body: some View {
        NavigationStack{
            List {
                Section("Cars"){
                    ForEach(cars){ car in
                        NavigationLink(
                            value:car
                        ){
                            Text(car.name)
                        }.navigationDestination(for: Car.self) { car in
                            Text("new Car: \(car.name)")
                        }
                    }
                }
                
            }
        }
        
        
    
            
        
    }
}

#Preview {
    navExample()
}
