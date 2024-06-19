import SwiftUI

struct Sales: Identifiable {
    var id = UUID()
    var title: String
    var sub: String
    var date: Date?
}

struct ContentView: View {
    @State private var data: [Sales] = [
        Sales(title: "Repartout", sub: "gros electro", date: Date()),
        Sales(title: "Repartout", sub: "petit electro", date: Date())
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ForEach(data.indices, id: \.self) { index in
                    VStack(spacing: 15) {
                        HStack {
                            if let date = data[index].date {
                                VStack {
                                    DatePicker("Date", selection: Binding<Date>(
                                        get: { date },
                                        set: { newDate in
                                            // Update the selected date for the specific item
                                            data[index].date = newDate
                                        }
                                    ), displayedComponents: [.date])
                                    .labelsHidden()
                                    .datePickerStyle(.compact)
                                    .padding(.horizontal)
                                }
                                
                                VStack {
                                    DatePicker("Heure", selection: Binding<Date>(
                                        get: { date },
                                        set: { newDate in
                                            // Update the selected date for the specific item
                                            data[index].date = newDate
                                        }
                                    ), displayedComponents: [.hourAndMinute])
                                    .labelsHidden()
                                    .datePickerStyle(.compact)
                                    .padding(.horizontal)
                                }
                            }
                            
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "washer.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 32, height: 32)
                                .foregroundColor(.orange)
                            
                            VStack(alignment: .leading) {
                                Text(data[index].title)
                                    .foregroundColor(.black)
                                    .font(.headline)
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
                        .padding(.horizontal)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                }
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Tableau de bord")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Détails de l'article")
            .navigationBarTitle("Détails", displayMode: .inline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
