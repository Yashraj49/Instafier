//
//  ContentView.swift
//  Instafilter
//
//  Created by Yashraj jadhav on 13/03/23.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var filterIntesity = 0.5
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage : UIImage?
 
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(.secondary)

                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)

                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    // select an image
                }

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntesity)
                }
                .padding(.vertical)

                HStack {
                    Button("Change Filter") {
                        // change filter
                    }

                    Spacer()

                    Button("Save") {
                        // save the picture
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
        
        func save() {
            Button("Save" , action: save)
        }
        
    }
    
    func loadImage () {
        guard let inputImage = inputImage else {return}
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
