//
//  RegisterBirthView.swift
//  Crewl
//
//  Created by NomoteteS on 5.03.2023.
//

import SwiftUI

enum dateFocusing {
    case day, mounth, year
}

//TODO: Code Redisgn
struct RegisterBirthView: View {
    
    @StateObject var viewModel: RegisterBirthViewModel
    @FocusState var FocusingState: dateFocusing?
    var body: some View {
        ZStack {
            Color.CrewlBackgroundColor
                .ignoresSafeArea()
            VStack {
                //MARK: RegisterBirthView - Header
                EntryHeader(title: "Ne zaman doğdun?",
                            description: "Diğer kullanıcılar sadece yaşını görebilir.")
                //MARK: RegisterBirthView - Textfield
                let isMonthStatus = (viewModel.monthBirth.count == 2)
                let isDayStatus = (viewModel.dayBirth.count == 2)
                HStack(spacing: 2){
                    TextField("AA", text: $viewModel.monthBirth.limit(2))
                        .frame(width: 25)
                        .focused($FocusingState, equals: .mounth)
                        .onChange(of: isMonthStatus) { value in
                            if value {
                                FocusingState = .day
                            }
                        }
                    Text("/")
                        .foregroundColor(isMonthStatus ? .CrewlBlack : .CrewlWhiteGray)
                    TextField("dd", text: $viewModel.dayBirth.limit(2))
                        .frame(width: 25)
                        .focused($FocusingState, equals: .day)
                        .onChange(of: isDayStatus) { value in
                            if value {
                                FocusingState = .year
                            }
                        }
                    Text("/")
                        .foregroundColor(isDayStatus ? .CrewlBlack : .CrewlWhiteGray)
                    TextField("YYYY", text: $viewModel.yearBirth.limit(4))
                        .frame(width: 45)
                        .focused($FocusingState, equals: .year)
                        .onChange(of: (viewModel.yearBirth.count < 4)) { value in
                            if value {
                                viewModel.isLegid = false
                            }
                        }
                    Spacer()
                }
                .padding(.horizontal)
                .frame(height: 60)
                .background{
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundColor(.CrewlWhite)
                        .overlay {
                            Rectangle()
                                .frame(height: 2)
                                .offset(y: 30)
                                .foregroundColor(viewModel.isLegid ? .red : .CrewlWhiteGray)
                        }
                }
                .padding(.horizontal)
                .keyboardType(.numberPad)
                //MARK: RegisterBirthView - Error massage
                HStack {
                    Text("*")
                        .foregroundColor(.red)
                    Text("Kayıt olmak için 18 yaşından büyük olman gerekiyor.")
                        .font(.Rounded12)
                        .foregroundColor(.CrewlGray)
                    Spacer()
                }
                .opacity(viewModel.isLegid ? 1 : 0)
                .padding(.leading,30)
                Spacer()
                //MARK: RegisterBirthView - Button
                let isLegidStatus = (2023 - (Int(viewModel.yearBirth) ?? 2023) > 17)
                let isAccessStatus = (isDayStatus && isMonthStatus && (viewModel.yearBirth.count == 4))
                ZStack {
                    NavigationLink(isActive: $viewModel.isReadyToNextView) {
                        viewModel.router.navigate(nameData: viewModel.nameData,
                                                  surnameData: viewModel.surnameData,
                                                  genderData: viewModel.genderData,
                                                  birthData: viewModel.birth)
                    } label: {  }
                    EntryButtonsCollected(isLoading: .constant(false),
                                          status: .constant(isAccessStatus)) {
                        
                    } buttonAction: {
                        if isAccessStatus {
                            if isLegidStatus != true {
                                viewModel.isLegid.toggle()
                            }
                        }else{
                            
                        }
                    }
                }
            }
        }
        .onAppear{
            FocusingState = .mounth
        }
    }
}

struct RegisterBirthView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterBirthView(viewModel: .init(nameData: "", surnameData: "", genderData: ""))
    }
}


