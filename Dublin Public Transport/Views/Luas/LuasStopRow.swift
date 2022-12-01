//
//  LuasStopRow.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI

struct LuasStopRow: View {
    var luasStop: LuasStop
    @State private var favourite = false

    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(luasStop.line == "Green" ? .green.opacity(0.85) : .red.opacity(0.85))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "tram.fill").foregroundColor(Color.background)
                }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Luas Stop \(luasStop.displayName)")
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text("\(luasStop.line.capitalized) line")
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
            }
            
            Spacer()
        }
    }
}

struct LuasStopRow_Previews: PreviewProvider {
    static var previews: some View {
        LuasStopRow(luasStop: luasStopPreviewData)
.previewInterfaceOrientation(.portrait)
        LuasStopRow(luasStop: luasStopPreviewData).preferredColorScheme(.dark).previewInterfaceOrientation(.portrait)
    }
}
