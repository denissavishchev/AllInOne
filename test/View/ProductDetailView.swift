import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Rectangle().frame(height: 0)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
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
                Image(product.image)
                    .resizable()
                    .frame(width: 200, height: 200)
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
                    
                }.padding(EdgeInsets(top: 4, leading: 12, bottom: 0, trailing: 12))
            Spacer()
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
