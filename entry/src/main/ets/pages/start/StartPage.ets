import { AdvertModel } from 'basic'

@Entry
@Component
struct StartPage {
  @State obj: AdvertModel = {
    adTime: 5,
    showAd: false
  }
  @State timer: number = -1

  // 页面开始加载的时候就会触发当前生命周期方法
  aboutToAppear(): void {
    this.countdown()
  }

  // 倒计时方法
  countdown() {
    this.timer = setInterval(() => {
      if (this.obj.adTime === 0) {
        clearInterval(this.timer)
        return
      }
      this.obj.adTime--
    }, 1000)
  }

  // 当前页面销毁的时候，一定要清楚定时器，如果不清除（内存泄露）
  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image($r('app.media.ad')).objectFit(ImageFit.Cover).expandSafeArea()
      Text(`${this.obj.adTime}秒后跳过`)
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