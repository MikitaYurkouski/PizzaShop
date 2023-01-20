//
//  ProfileView.swift
//  PizzaShop
//
//  Created by Никита Юрковский on 10.01.23.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAletPresented = false
    @State var isAuthViewPresented = false
    
    
//    //Будем менять текстовые значения, которые мы писали на значения из карточки клиента (которые приходят от сервера???)
//    @State var name: String = "Имя Фамилия"
//    @State var phone: Int = 999888777666
//    @State var addres: String = "Ваш адрес будет тут"
    
    //@State свойства выше мы перенесли в ProfileViewModel
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 16) {
                Image("user")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(1)
                    .background(Color("lightGray"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Откуда взять фотку?", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("Из галереи")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("С камеры")
                        }
                    }
                    
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Имя", text: $viewModel.profile.name)
                        .font(.body.bold())
                   // Text("Мировлав Филиппецкий") Добавили @State свойства вместо этой записи
                        //.bold()
                    
                    HStack {
                        Text("+375")
                        // Код региона у нас остался, а остальную часть номера принимает как значение
                        TextField("(Код оператора)Телефон",
                                  value: $viewModel.profile.phone,
                                  format: .number)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Адрес доставки:")
                    .bold()
                TextField("Ваш адрес", text: $viewModel.profile.addres)
                
                //Text("Россия, Московская область, г. Нижний Новгород, ул. Юный Юннатов, д. 34, кв. 18")
            } .padding(.horizontal)
            
            // Таблица с заказами
            List {
                Text("Ваши заказы будут тут")
            } .listStyle(.plain)
            
            Button {
                isQuitAletPresented.toggle()
            } label: {
                Text("Выйти")
                    .padding()
                    .padding(.horizontal)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            } .padding()
                .confirmationDialog("Вы действительно хотите выйти?",
                                    isPresented: $isQuitAletPresented,
                                    titleVisibility: .visible) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Да")
                    }
                }
                                    .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                                        AuthView()
                                    }
        }
                                    .onSubmit {
                                        viewModel.setProfile()
                                            }
                                    .onAppear {
                                        self.viewModel.getProfile()
                                    }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: MWUser(id: "",
                                                                name: "Владик Пашков",
                                                                phone: 8877666,
                                                                addres: "г. Минск, ул. Пирожковая, дом 16")))
    }
}
