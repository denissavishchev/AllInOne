import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    @State private var toggle: Bool = false
    @State private var count: Int = 1
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Rectangle().frame(height: 0)
                }
                .frame(maxWidth: .infinity)
                .background(Color(.lightBlue))
                HStack{
                    HStack{
                        Text("Product")
                    }
                    .frame(width: 100, height: 40)
                    .background(Color(.green))
                    .cornerRadius(8)
                    .padding(.leading, 12)
                    Spacer()
                }
//                ^
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(product.reviews.rating.formatted())")
                    Text("|")
                    Text("\(product.reviews.count) reviews")
                    Spacer()
                    Image(product.isDiscount == true ? "off" : "")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding(.leading, 12)
                .padding(.trailing, 12)
                HStack{
                    Text(product.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundColor(.black)
                        .shadow(radius: 5)
                    Spacer()
                }.padding(.leading, 12)
                                HStack{
                                    Image(product.countryImage)
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    Text(product.country)
                                    Spacer()
                                }.padding(.leading, 12)
                                HStack{
                                    Text("Description:")
                                    Spacer()
                                }
                                .padding(.leading, 12)
                                .padding(.top, 12)
                                Text(product.description)
                                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 0, trailing: 12))
                VStack{
                    HStack{
                        Text("Basic characteristics:")
                        Spacer()
                    }
                    HStack{
                        Text("Production")
                        VStack {
                            Divider().background(.black)
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Text(product.characteristics.production)
                    }
                    HStack{
                        Text("Energy / 100g")
                        VStack {
                            Divider().background(.black)
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Text("\(product.characteristics.energyValue[0]) cal")
                        Text("/ \(product.characteristics.energyValue[1]) KJ")
                    }
                    HStack{
                        Text("Fats / 100g")
                        VStack {
                            Divider().background(.black)
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Text("\(product.characteristics.fats.formatted()) g")
                    }
                    HStack{
                        Text("Squirrels / 100g")
                        VStack {
                            Divider().background(.black)
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Text("\(product.characteristics.squirrels.formatted()) g")
                    }
                    HStack{
                        Text("Carbohydrates")
                        Text("/ 100g")
                        VStack {
                            Divider().background(.black)
                        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        Text("\(product.characteristics.carbohydrates.formatted()) g")
                    }
                }
                .padding()
                VStack{
                    HStack{
                        Text("Reviews")
                            .font(.system(size: 22))
                            .bold()
                            .foregroundColor(.black)
                        Spacer()
                        Text("\(product.reviews.count)")
                            .font(.system(size: 22))
                            .bold()
                            .foregroundColor(.green)
                    }
                    .padding(EdgeInsets(top: 4, leading: 12, bottom: 0, trailing: 12))
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(product.reviews.review){ prod in
                                ReviewItem(product: prod)
                            }
                        }
                    }
                    .contentMargins(.leading, 12, for: .scrollContent)
                    }
                HStack{
                    Text("Leave opinion")
                        .font(.system(size: 22))
                        .foregroundStyle(Color(.green))
                        .bold()
                        
                }
                .frame(maxWidth: .infinity, maxHeight: 30)
                .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                .background(.white)
                .cornerRadius(24)
                .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(.green, lineWidth: 3))
                .padding()
                
                HStack{
                    if !toggle { Spacer() }
                    HStack{
                        Text(toggle ? "Pcs" : "Kg")
                            .font(.system(size: 22))
                            .bold()
                    }
                    .frame(width: 200, height: 40)
                    .background(Color(.lightBlue))
                    .cornerRadius(10)
                    .padding(6)
                    if toggle { Spacer() }
                }
                .onTapGesture {
                    withAnimation(.spring(duration: 0.3)){
                        toggle.toggle()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(.gray.opacity(0.4))
                .cornerRadius(12)
                .padding()
                
                HStack{
                    Image(systemName: "minus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .onTapGesture {
                            withAnimation(.spring(duration: 0.3)){
                                if count > 1{
                                    count -= 1
                                }
                            }
                        }
                    Spacer()
                    Text("\(count) Pcs")
                        .foregroundStyle(Color(.white))
                        .font(.system(size: 22))
                        .bold()
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .onTapGesture {
                            withAnimation(.spring(duration: 0.3)){
                                count += 1
                            }
                        }
                }
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                .frame(width: 200, height: 60)
                .background(Color(.green))
                .cornerRadius(40)
                .padding(6)
                
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .background(Color(.lightBlue))
            }
            .background(Color(.lightBlue))
            
        }
    }
    
    #Preview {
        ProductDetailView(product: Product.mocData()[2])
    }

struct ReviewItem: View {
    
    let product: Review
    
    var body: some View {
        VStack(alignment: .leading){
            Text(product.name)
            Text(product.date)
            HStack{
                ForEach(1..<6){ i in
                    StarView(fill: fillingFor(i))
                }
            }
            Spacer()
            Text(product.description)
        }
        .padding(12)
        .frame(width: 220, height: 200)
        .background(Color(.green))
        .cornerRadius(12)
    }
    private func fillingFor(_ index: Int) -> Bool {
        index <= product.rating
    }
}

struct StarView: View {
    
    let fill: Bool
    
    var body: some View {
        Image(systemName: fill ? "star.fill" : "star")
            .resizable()
            .frame(width: 18, height: 18)
            .foregroundStyle(.yellow)
    }
}
    


