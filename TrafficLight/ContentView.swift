//
//  ContentView.swift
//  TrafficLight
//
//  Created by Никита Горбунов on 07.04.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    
    @State private var buttonTitle = "START"
    
    @State  private var redCircleView = 0.3
    @State  private var yellowCircleView = 0.3
    @State  private var greenCircleView = 0.3
    
    @State private var ColorCircle = CurrentLight.red
    
    private func nextColorCircle() {
        
        let circleIsOn = 1.0
        let circleIsOff = 0.3
        
        switch ColorCircle {
        case .red:
            ColorCircle = .yellow
            greenCircleView = circleIsOff
            redCircleView = circleIsOn
        case .yellow:
            ColorCircle = .green
            redCircleView = circleIsOff
            yellowCircleView = circleIsOn
        case .green:
            ColorCircle = .red
            yellowCircleView = circleIsOff
            greenCircleView = circleIsOn
        }
    }
    
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                ColorCircleView(color: .red, opacity: redCircleView)
                ColorCircleView(color: .yellow, opacity: yellowCircleView)
                ColorCircleView(color: .green, opacity: greenCircleView)
                
                Spacer()
                
                ChangeColorButton(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    nextColorCircle()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
