//
//  ImageView.swift
//  SwileTest
//
//  Created by Mateus de Campos on 17/03/23.
//

import SwiftUI

struct ImageView: View {

    var url: URL?
    var imageName: String

    init(imageName: String, url: URL? = nil) {
        self.imageName = imageName
        self.url = url
    }

    var body: some View {
        if let url = self.url {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
        } else {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageName: "icon_burger")
            .frame(width: 24, height: 24)
        ImageView(imageName: "icon_burger", url: URL(string: "https://res.cloudinary.com/hbnjrwllw/image/upload/v1583240999/neobank/charity/cdaa7851-da33-4b3c-8e01-228c4b085ac3.png"))
            .frame(width: 24, height: 24)
    }
}

