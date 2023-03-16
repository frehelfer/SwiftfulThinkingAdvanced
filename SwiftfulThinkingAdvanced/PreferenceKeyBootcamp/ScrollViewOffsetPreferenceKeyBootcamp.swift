//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvanced
//
//  Created by Frédéric Helfer on 09/03/23.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKay: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func scrollViewOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background {
                GeometryReader { geo in
                    Text("")
                        .preference(key: ScrollViewOffsetPreferenceKay.self, value: geo.frame(in: .global).minY)
                }
            }
            .onPreferenceChange(ScrollViewOffsetPreferenceKay.self, perform: { value in
                action(value)
            })
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    
    let title: String = "New title here!"
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    titleLayer
                        .opacity(Double(scrollViewOffset) / 75.0)
                        .scrollViewOffsetChanged { offset in
                            self.scrollViewOffset = offset
                        }
                    
                    contentLayer
                }
                .padding()
            }
            .overlay {
                Text("\(scrollViewOffset)")
            }
            .overlay(alignment: .top) {
                navBarLayer
                    .opacity(scrollViewOffset < 40 ? 1.0 : 0.0)
            }
        }
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewOffsetPreferenceKeyBootcamp()
    }
}

extension ScrollViewOffsetPreferenceKeyBootcamp {
    private var titleLayer: some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<30) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}
