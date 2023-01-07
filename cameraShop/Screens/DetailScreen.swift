//
//  CameraShopApp.swift
//  CameraShop
//
//  Created by Joff on 12/12/22.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            Color("Bg")
            ScrollView  {
                //            Product Image
                
                Image("cam_4")
                    .resizable(capInsets: EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0))
                    .aspectRatio(contentMode: .fit)
                        .edgesIgnoringSafeArea(.top)
                
                DescriptionView()
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("$1299")
                    .font(.title)
                    .foregroundColor(.white)
                Spacer()
                
                Text("Adicionar")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
                    .padding()
                    .padding(.horizontal, 8)
                    .background(Color.white)
                    .cornerRadius(10.0)
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(60.0, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot"))
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}


struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack (alignment: .leading) {
            //                Title
            Text("Camera Sony \n Alpha 7 III")
                .font(.title)
                .fontWeight(.bold)
            //                Rating
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            Text("Distinguished by its updated sensor design, the Sony a7 III is a well-rounded camera suitable for both photo and video applications in a variety of working situations. Refined for improved speed and low-light performance, a new 24.2MP Exmor R BSI CMOS sensor and BIONZ X processor!")
                .lineSpacing(8.0)
                .opacity(0.6)
            
            //                Info
            HStack (alignment: .top) {
                VStack (alignment: .leading) {
                    Text("Photo Specs")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("Sony E - Mount")
                        .opacity(0.6)
                    Text("25.3 Megapixel")
                        .opacity(0.6)
                    Text("Sensor-Shift")
                        .opacity(0.6)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Video specs")
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                    Text("UHD 4K30p")
                        .opacity(0.6)
                    Text("IONZ X Image Processor")
                        .opacity(0.6)
                    Text("5-Axis")
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            //                Colors and Counter
            HStack {
                VStack (alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack {
                        ColorDotView(color: Color.white)
                        ColorDotView(color: Color.black)
                        ColorDotView(color: Color(#colorLiteral(red: 0.1803921569, green: 0.6352941176, blue: 0.6705882353, alpha: 1)))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    //                        Minus Button
                    Button(action: {}) {
                        Image(systemName: "minus")
                            .padding(.all, 8)
                        
                    }
                    .frame(width: 30, height: 30)
                    .overlay(RoundedCorner(radius: 50).stroke())
                    .foregroundColor(.black)
                    
                    Text("1")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 8)
                    
                    //                        Plus Button
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.all, 8)
                            .background(Color("Primary"))
                            .clipShape(Circle())
                    }
                }
                
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(30, corners: [.topLeft, .topRight])
        .offset(x: 0, y: -30.0)
    }
}


struct BackButton: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.backward")
                .foregroundColor(.black)
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
        }
    }
}
