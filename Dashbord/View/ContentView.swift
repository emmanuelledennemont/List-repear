// ContentView.swift


import SwiftUI

struct ContentView: View {
    @State private var data: [DataItem] = generateData()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ForEach(data.indices, id: \.self) { index in
                    VStack(spacing: 15) {
                        VStack {
                            HStack {
                                if let date = data[index].date {
                                    createDatePicker(
                                        label: "Date",
                                        date: date,
                                        displayedComponents: [.date]
                                    ) { newDate in
                                        data[index].date = newDate
                                    }
                                    
                                    Spacer()
                                        .padding()
                                    
                                    createDatePicker(
                                        label: "Heure",
                                        date: date,
                                        displayedComponents: [.hourAndMinute]
                                    ) { newDate in
                                        data[index].date = newDate
                                    }
                                }
                            }
                            .padding(.top)

                            Divider()
                                .background(Color.gray)
                                .padding(.horizontal)
                            
                            HStack(alignment: .center) {
                                Image(systemName: data[index].type.iconName())
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.orange)

                                VStack(alignment: .leading) {
                                    Text(data[index].title)
                                        .font(.title3)
                                        .bold()

                                    Text(data[index].sub)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                NavigationLink(destination: DetailView()) {
                                    HStack(spacing: 5) {
                                        Text("Voir plus")
                                            .foregroundColor(.orange)
                                            .underline()

                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.orange)
                                    }
                                }
                            }
                            .padding()
                        }
                        .background(Color.white)
                        .cornerRadius(10)
                        .modifier(BottomShadowModifier(radius: 2, yOffset: 2))
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .padding()
            .navigationBarTitle("Tableau de bord")
        }
    }
    
    private func createDatePicker(
        label: String,
        date: Date,
        displayedComponents: DatePicker.Components,
        onDateChange: @escaping (Date) -> Void
    ) -> some View {
        DatePicker(label, selection: Binding<Date>(
            get: { date },
            set: { newDate in
                onDateChange(newDate)
            }
        ), displayedComponents: displayedComponents)
        .labelsHidden()
        .datePickerStyle(.compact)
        .environment(\.locale, Locale(identifier: "fr_FR")) // Utilisation de la locale française
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DetailView: View {
    var body: some View {
        Text("Détails de l'article")
            .navigationBarTitle("Détails", displayMode: .inline)
    }
}

struct BottomShadowModifier: ViewModifier {
    var radius: CGFloat
    var yOffset: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width, height: geometry.size.height + yOffset)
                        .shadow(color: Color.black.opacity(0.1), radius: radius, x: 0, y: yOffset)
                }
            )
    }
}

#Preview {
    ContentView()
}
