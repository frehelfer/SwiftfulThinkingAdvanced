//
//  UIViewRepesentableBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Frédéric Helfer on 15/03/23.
//

import SwiftUI

struct UIViewRepesentableBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text(text)
            
            HStack {
                Text("SwiftUI:")
                TextField("Type Here..", text: $text)
                    .frame(height: 55)
                    .background(Color.gray)
            }
            
            HStack {
                Text("UIKit:")
                UITextFieldViewRepresentable(text: $text)
                    .updatePlaceholder("hahahah")
                    .frame(height: 55)
                    .background(Color.gray)            }
        }
    }
}

struct UIViewRepesentableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        UIViewRepesentableBootcamp()
    }
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeholder: String
    let placeholderColor: UIColor
    
    init(text: Binding<String>, placeholder: String = "Default placeholder...", placeholderColor: UIColor = .blue) {
        self._text = text
        self.placeholder = placeholder
        self.placeholderColor = placeholderColor
    }
    
    func makeUIView(context: Context) -> UITextField {
        let placeholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor : placeholderColor]
        )
        
        let textField = UITextField()
        textField.attributedPlaceholder = placeholder
        textField.delegate = context.coordinator
        return textField
    }
    
    func updatePlaceholder(_ text: String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeholder = text
        return viewRepresentable
    }
    
    // from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    // from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
}


struct BasicUIViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
}
