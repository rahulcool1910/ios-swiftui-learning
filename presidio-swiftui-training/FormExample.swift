//
//  FormExample.swift
//  presidio-swiftui-training
//
//  Created by Rahul R on 06/10/23.
//

import SwiftUI



struct Tips:Identifiable, Hashable{
    let id = NSUUID().uuidString
    var text:String;
    var percentage:Int;
}

struct FormExample: View {
    @State var billAmount:Double = 0
    @State var nubmerOfPeople:Int = 2
    @State var tipSelected = 0;
    @State var lastName:String = ""
    
    @State var finalBillAmount:Double=0
    
    //    var tips:[Tips]=[
    //        .init(text: "0%", percentage: 0),
    //        .init(text: "10%", percentage: 10),
    //        .init(text: "15%", percentage: 15),
    //        .init(text: "20%", percentage: 20),
    //
    //    ]
    
    let tips = [0,10,15,20]
    
    
    
    
    var amountPerPerson: Double {
        let tipPlusBill = billAmount + ((billAmount)*Double(tipSelected))/100.0
        return tipPlusBill/Double(nubmerOfPeople)
    }
    
    
    @FocusState private var focusedField:Bool
    
    var body: some View {
        NavigationStack{
            
            Form{
                Section("Enter Bill Amount"){
                    TextField("",value: $billAmount, format: .currency(code: "INR"))
                        .keyboardType(.decimalPad)
                        .focused($focusedField)
                        .submitLabel(.next)
                    
                    
                }
                
                Section("Select A Tip"){
                    Picker(selection: $tipSelected, label: Text("text")) {
                        ForEach(tips, id: \.self){ tip in
                            Text("\(tip,format: .percent)")
                        }
                    }.pickerStyle(.segmented)
                        .focused($focusedField)
                }
                Section("Number Of Peoples"){
                    Picker(selection: $nubmerOfPeople, label: Text("Number of People")) {
                        ForEach(2...10, id: \.self){ people in
                            Text("\(people)")
                        }
                    }
                    .focused($focusedField)
                }
                Text("\(amountPerPerson)")
                
            }
            .onSubmit {
                print("done")
            }
            //            .onTapGesture{
            //                focusItem = false
            //            }
            
            
            
            
        }
        
        
        
        
    }
    
    struct ContentView_Previews:
        PreviewProvider{
        static var previews: some View{
            FormExample()
        }
    }
    
}
