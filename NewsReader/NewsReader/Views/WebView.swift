//
//  WebView.swift
//  NewsReader
//
//  Created by Евгений Макеев on 10.02.2022.
//
import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        guard let safeString = urlString else { print("Error urlString"); return }
        guard let url = URL(string: safeString) else { print("Error URL"); return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

