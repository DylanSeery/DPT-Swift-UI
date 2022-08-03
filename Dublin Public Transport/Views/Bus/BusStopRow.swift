//
//  BusStopRow.swift
//  Dublin Public Transport
//
//  Created by Dylan Seery on 02/08/2022.
//

import SwiftUI
import MapKit

struct BusStopRow: View {
    var busStop: BusStop
    @State private var favourite = false

    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.5))
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "bus.doubledecker.fill").foregroundColor(Color.background)
                }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Bus Stop Number \(busStop.StopNumber)")
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text(busStop.Description)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Button(action: {
                self.favourite = !self.favourite
            }) {
                Image(systemName: !favourite ? "star" : "star.fill").foregroundColor(Color.icon)
            }
            
        }.padding(8)
    }
}

struct BusStopRow_Previews: PreviewProvider {
    static var previews: some View {
        BusStopRow(busStop: busStopPreviewData)
.previewInterfaceOrientation(.portrait)
        BusStopRow(busStop: busStopPreviewData).preferredColorScheme(.dark).previewInterfaceOrientation(.portrait)
    }
}
