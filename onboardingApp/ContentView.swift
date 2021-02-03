import SwiftUI

struct ContentView: View {
  @State var tag = 0
  
  var body: some View {
    ZStack {
      // 背景
      RadialGradient(
        gradient: Gradient(colors: [Color.blue, Color.black.opacity(0.2)]),
        center: .center,
        startRadius: 1,
        endRadius: 700
      )
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 0) {
        // タイトル
        Text("Welcome To")
          .font(.system(size: 30, weight: .medium, design: .rounded))
          .padding(.top, 20)
          .padding(.bottom, 10)
        
        Text("SwiftUI")
          .font(.system(size: 40, weight: .heavy, design: .rounded))
          .padding(.bottom, 40)
        
        // 横スライドビュー
        VStack(alignment: .trailing, spacing: 0) {
          HStack {
            ForEach(data) { page in
              VStack(spacing: 0) {
                Image(page.image)
                  .resizable()
                  .frame(
                    width: UIScreen.main.bounds.width / 2.0,
                    height: UIScreen.main.bounds.height / 3.0
                )
                  .padding(.bottom)
                
                Text(page.text)
                  .font(.system(size: 15, weight: .medium, design: .rounded))
                  .frame(width: UIScreen.main.bounds.width / 1.3)
                  .fixedSize(horizontal: false, vertical: true)
                  .lineLimit(nil)
              }
              .frame(width: UIScreen.main.bounds.width)
            }
          }
          .offset(x: UIScreen.main.bounds.width * CGFloat((data.count - 1)) / 2)
          .offset(x: -UIScreen.main.bounds.width * CGFloat(self.tag))
          .animation(
            .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.0)
          )
        }
        .padding(.bottom, 30)
        
        // 三連ボタン
        HStack(spacing: 20) {
          Button(action: {
            self.tag = 0
          }) {
            Text("1")
              .foregroundColor(Color.white)
              .padding(8)
              .background(
                Circle()
                  .stroke(Color.white, lineWidth: 2)
            )
          }
          .offset(x: self.tag == 0 ? 2 : 0, y: self.tag == 0 ? -2 : 0)
          .scaleEffect(self.tag == 0 ? 1.3 : 1.0)
          .animation(.default)
          
          Button(action: {
            self.tag = 1
          }) {
            Text("2")
              .foregroundColor(Color.white)
              .padding(8)
              .background(
                Circle()
                  .stroke(Color.white, lineWidth: 2)
            )
          }
          .scaleEffect(self.tag == 1 ? 1.3 : 1.0)
          .animation(.default)
          
          Button(action: {
            self.tag = 2
          }) {
            Text("3")
              .foregroundColor(Color.white)
              .padding(8)
              .background(
                Circle()
                  .stroke(Color.white, lineWidth: 2)
            )
          }
          .offset(x: self.tag == 2 ? -2 : 0, y: self.tag == 2 ? -2 : 0)
          .scaleEffect(self.tag == 2 ? 1.3 : 1.0)
          .animation(.default)
        }
        .padding(.bottom)
        
        // continueボタン
        Button(action: {}) {
          Text("Continue >")
            .foregroundColor(Color.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(
              Capsule()
          )
            .scaleEffect(self.tag == 2 ? 1.0 : 0.0)
            .animation(
              .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0.0)
          )
        }
        
        Spacer()
      }
      .frame(
        width: UIScreen.main.bounds.width,
        height: UIScreen.main.bounds.height
      )
    }
  }
}

struct Page: Identifiable {
  let id: Int
  let image: String
  let text: String
}

let data = [
  Page(id: 1, image: "Player1", text: "Overview. SwiftUI provides views, controls, and layout structures for declaring your app's user interface"),
  Page(id: 2, image: "Player2", text: "Have you ever wondered how SwiftUI and Combine will change the way you architect, test, and build your iOS apps"),
  Page(id: 3, image: "Player3", text: "Learn how to download a SwiftUI image asynchronously from a URL and display it in a list by")
]
