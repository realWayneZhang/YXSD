@Entry
@Component
struct StartPage {
  @State message: string = 'Hello World';

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image($r('app.media.ad')).objectFit(ImageFit.Cover).expandSafeArea()
      Text('5秒后跳过')
        .height(30)
        .backgroundColor('#66999999')
        .padding({
          left: 10,
          right: 10,
          top: 5,
          bottom: 5
        })
        .margin({ right: 15 })
        .borderRadius(13)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
    }
  }
}