import SwiftUI

struct ContentView: View {
    @State private var password: String = ""
    @StateObject private var viewModel: ContentViewModel = ContentViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Spacer()

                TextField("password", text: $password)
                    .padding([.leading, .trailing], 10)
                    .frame(height: 44)
                    .background(RoundedRectangle(cornerRadius: 8, style: .continuous)
                                    .stroke(AppColors.textInputOverlay, lineWidth: 1))

                Button("Login", action: {
                    viewModel.login(with: password)
                })
                    .buttonStyle(SolidButtonStyle())

                Spacer()
            }
            .padding()
        }
        .alert(isPresented: $viewModel.showAlert, content: {
            Alert(title: Text(viewModel.alertMessage))
        })
        .navigationBarTitleDisplayMode(.inline)
        .toolbar { appTitle() }
    }

    @ToolbarContentBuilder
    private func appTitle() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack {
                AppImages.appTitleImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .colorInvert()
                // TODO colorInvert as per the scheme
                Text(AppStrings.appTitle)
                    .font(.title.bold())
                    .foregroundColor(AppColors.navigationForeground)
            }
            .padding(.bottom, 8)
        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
