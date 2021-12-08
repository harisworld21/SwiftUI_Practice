//
//  AsyncImageRow.swift
//  AsyncImage
//
//  Created by HariRamya on 08/12/2021.
//

import SwiftUI

struct AsyncImageRow: View {
    let titleTxt : String
    var body: some View {
        Text(titleTxt)
    }
}

struct AsyncImageRow_Previews: PreviewProvider {
    static var previews: some View {
        AsyncDownloadList()
    }
}
