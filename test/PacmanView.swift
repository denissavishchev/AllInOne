import SwiftUI

struct PacmanView: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack {
                HStack{
                    Rectangle().fill(.clear)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    VStack{
                        Text("Today")
                            .font(.system(size: 24))
                            .foregroundStyle(.customDarkBlue)
                        Text("Monday, march 2")
                            .font(.system(size: 16))
                            .foregroundStyle(.customBlue)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    Image("Calendar")
                        .resizable()
                        .foregroundColor(.customBlue)
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 16)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(height: 56)
                VStack{
                    HStack{
                        Text("234 cal")
                        Image("Up")
                            .resizable()
                            .foregroundColor(.customDarkBlue)
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 10)
                        Spacer()
                        Text("Add food")
                            .foregroundStyle(.white)
                            .padding(EdgeInsets(top: 8, leading: 14, bottom: 8, trailing: 14))
                            .background(Color(.red))
                            .cornerRadius(6)
                    }.padding([.leading, .trailing, .top], 12)
                    VStack{
                        Image("Pacman")
                            .resizable()
                            .foregroundColor(.yellow)
                            .frame(width: 40, height: 40)
                        HStack{
                            Spacer()
                            Text("1755")
                            Spacer()
                            Text("2000 cal")
                        }
                    }.padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color(.white))
                .cornerRadius(12)
                .padding(EdgeInsets(top: 20, leading: 18, bottom: 0, trailing: 16))
                 Spacer()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color(.lightBlue))
        
        }
    }
}

#Preview {
    PacmanView()
}

