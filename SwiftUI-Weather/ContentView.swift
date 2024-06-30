//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Gaurav Sharma on 26/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: isNight)
            
            VStack{
                
                CityTextView(cityName: "Cupertino, CA")
                VStack(spacing: 8){
                 
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                         temrature: 76)
                    
                    HStack(spacing: 20) {
                        WeatherDayView(dayOfWeek: "TUE",
                                       imageName: "cloud.sun.fill",
                                       temprature: 76)
                        WeatherDayView(dayOfWeek: "WED",
                                       imageName: "sun.max.fill",
                                       temprature: 88)
                        WeatherDayView(dayOfWeek: "THU",
                                       imageName: "wind.snow",
                                       temprature: 55)
                        WeatherDayView(dayOfWeek: "FRI",
                                       imageName: "sunset.fill",
                                       temprature: 60)
                        WeatherDayView(dayOfWeek: "SAT",
                                       imageName: "snow",
                                       temprature: 25)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        isNight.toggle()
                    }, label: {
                        WeatherButton(title: "Change Day Time",
                                      backgroundColor: .white,
                                      textColor: .blue)
                    })
                   
                    Spacer()

                }
            }
            
        }
       
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temprature: Int

    var body: some View {
        HStack{
            VStack{
                Text(dayOfWeek)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temprature)°")
                    .font(.system(size: 28, weight: .medium))
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct BackgroundView: View {
    
   var isNight : Bool
    
    var body: some View {
//        LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName : String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    
    var imageName: String
    var temrature: Int
    
    var body: some View{
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        
        Text("\(temrature)°")
            .font(.system(size: 70, weight: .medium))
            .foregroundColor(.white)
        
            .padding(.bottom,40)
    }
    
}

