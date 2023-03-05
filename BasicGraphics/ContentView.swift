//
//  ContentView.swift
//  BasicGraphics
//
//  Created by Juan Camilo Marín Ochoa on 5/03/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var dataTest = DataTestModel()
    @State var showGraph: [Bool] = Array(repeating: false, count: 2)
    
    init() {
        dataTest.getData()
    }
    
    var body: some View {
        buildBody
    }
    
    private var buildBody: some View {
        ScrollView{
            // MARK: Progreso
            GraphProgressView(data: dataTest.dataProgress)
                .padding([.leading, .trailing])
                .opacity(showGraph[0] ? 1 : 0)
                .offset(y: showGraph[0] ? 0 : 250)
            
            Divider()
                .padding(.vertical, 20)
                .padding(.horizontal)
                .opacity(showGraph[0] ? 1 : 0)
                .offset(y: showGraph[0] ? 0 : 250)
            
            
            // MARK: Linear
            GraphLinearView(data: dataTest.dataLinear)
                .padding([.leading, .trailing])
                .opacity(showGraph[1] ? 1 : 0)
                .offset(y: showGraph[1] ? 0 : 400)
        }
        .onAppear(perform: animateViews)
    }
    
    private func animateViews(){
        withAnimation(.easeInOut.delay(0.3)){
            showGraph[0] = true
        }
        
        withAnimation(.easeInOut.delay(0.45)){
            showGraph[1] = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
