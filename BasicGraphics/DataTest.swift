//
//  DataTest.swift
//  BasicGraphics
//
//  Created by Juan Camilo Marín Ochoa on 5/03/23.
//

import SwiftUI

class DataTestModel: ObservableObject {
    @Published var dataProgress: [GraphProgressModel] = []
    @Published var dataLinear: [GraphLinearModel] = []
    @Published var showLoading = true
    
    func getData() {
        self.dataProgress = getDataProgress()
        self.dataLinear = getDataLinear()
        
        loading();
    }
    
    private func getDataLinear()->[GraphLinearModel] {
        return [
            GraphLinearModel(value: 1000000, label: "MON", color: ColorsTokens.primary),
            GraphLinearModel(value: 250000, label: "TUE", color: ColorsTokens.primary),
            GraphLinearModel(value: 50000, label: "WED", color: ColorsTokens.primary),
            GraphLinearModel(value: 476000, label: "THU", color: ColorsTokens.primary),
            GraphLinearModel(value: 690000, label: "FRI", color: ColorsTokens.primary),
            GraphLinearModel(value: 540000, label: "SAT", color: ColorsTokens.primary),
            GraphLinearModel(value: 2040000, label: "SUN", color: ColorsTokens.primary),
        ]
    }
    
    private func getDataProgress()->[GraphProgressModel] {
        return [
            GraphProgressModel(
                progress: 90,
                value: "Invoices",
                icon: "doc.plaintext",
                mainColor: ColorsTokens.red,
                circleColor: AngularGradient(
                    gradient: Gradient(colors: [
                        ColorsTokens.red,
                        ColorsTokens.pink,
                        ColorsTokens.pink,
                        ColorsTokens.red,
                    ]),
                    center: .center
                )
            ),
            
            GraphProgressModel(
                progress: 113,
                value: "Income",
                icon: "chart.line.uptrend.xyaxis",
                mainColor: ColorsTokens.darkGreen   ,
                circleColor: AngularGradient(
                    gradient: Gradient(colors: [
                        ColorsTokens.green,
                        ColorsTokens.lemonGreen,
                        ColorsTokens.green,
                    ]),
                    center: .center
                )
            ),
            
            GraphProgressModel(
                progress: 70,
                value: "New clients",
                icon: "person.3.fill",
                mainColor: ColorsTokens.primary,
                circleColor: AngularGradient(
                    gradient: Gradient(colors: [
                        ColorsTokens.lightPrimary,
                        ColorsTokens.aquaPrimary,
                        ColorsTokens.lightPrimary,
                    ]),
                    center: .center
                )
            )
        ]
    }
    
    private func loading(){
        let seconds = DispatchTimeInterval.seconds(2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            withAnimation(.spring()) {
                self.showLoading.toggle()
            }
        }
    }
}
