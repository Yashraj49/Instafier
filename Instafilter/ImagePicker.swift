//
//  ImagePicker.swift
//  Instafilter
//
//  Created by Yashraj jadhav on 14/03/23.
//
import SwiftUI
import Foundation
import PhotosUI

 //MARK: - Conforming to UIViewControllerRepresentable does require us to fill in that struct with two methods: one called makeUIViewController(), which is responsible for creating the initial view controller, and another called updateUIViewController(), which is designed to let us update the view controller when some SwiftUI state changes.

struct ImagePicker : UIViewControllerRepresentable {
    @Binding var image : UIImage?
    
    class Coordinator : NSObject , PHPickerViewControllerDelegate {
        
        var parent:ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            guard let provider = results.first?.itemProvider else {return}
            
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                    
                }
            }
        }
        
        
    }

    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator as! any PHPickerViewControllerDelegate
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
}
