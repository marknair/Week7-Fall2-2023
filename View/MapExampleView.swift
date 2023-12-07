//
//  ContentView.swift
//  Mappy
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let astroClock = CLLocationCoordinate2D(latitude: 50.087008, longitude: 14.420600)
    
    static let pragueCastle = CLLocationCoordinate2D(latitude: 50.08975, longitude: 14.3984)
}

struct MapExampleView: View {
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $position) {
            Annotation("Astro Clock", coordinate: .astroClock, anchor: .bottom) {
                ZStack {
                    Circle()
                        .foregroundStyle(.indigo.opacity(0.5))
                        .frame(width: 80, height: 80)
                    
                    Image(systemName: "clock.circle.fill")
                        .symbolEffect(.variableColor)
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.indigo)
                        .clipShape(Circle())
                }
            }
        }
        
        .onAppear {
            position = .item(MKMapItem(placemark: .init(coordinate: .astroClock)))
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Button(action: {
                    withAnimation {
                        position = .camera(MapCamera(
                            centerCoordinate: .astroClock,
                            distance: 800,
                            heading: 90,
                            pitch: 50))
                        //position = .item(MKMapItem(placemark: .init(coordinate: .astroClock)))
                    }
                }) {
                    
                    Text("Astronomical Clock")
                }
                .tint(.black)
                .buttonStyle(.borderedProminent)
                
                Button(action: {
                    withAnimation {
                        position = .item(MKMapItem(placemark: .init(coordinate: .pragueCastle)))
                    }
                }) {
                    Text("Prague Castle")
                }
                .tint(.black)
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    MapExampleView()
}
