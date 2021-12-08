//
//  AsyncDownloadList.swift
//  AsyncImage
//
//  Created by HariRamya on 08/12/2021.
//

import SwiftUI
import Combine

enum AsyncImageList :String, CaseIterable{
    case BASIC
    case SCALE
    case PLACEHOLDER
    case PHASE
    case ANIMATION
}

struct AsyncDownloadList: View {
     var body: some View {
         NavigationView {
             List(AsyncImageList.allCases, id: \.rawValue) { item in
                 HStack {
                     AsyncImageRow(titleTxt: item.rawValue)
                         .previewLayout(.fixed(width: 300, height: 75))
                     NavigationLink("") {
                         ContentView(currentItem: AsyncImageList(rawValue: item.rawValue)!)
                     }
                 }
             }
         }
    }
}

struct AsyncDownloadList_Previews: PreviewProvider {
    static var previews: some View {
        AsyncDownloadList()
    }
}
