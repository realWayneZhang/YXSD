import { AdvertModel } from 'basic'
import { window } from '@kit.ArkUI'

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

  // 销毁子窗口的方法
  closeAd() {
    window.findWindow('ad_window').destroyWindow()
  }

  // 倒计时方法
  countdown() {
    this.timer = setInterval(() => {
      if (this.obj.adTime === 0) {
        // 清除定时器
        clearInterval(this.timer)
        // 销毁广告子窗口
        this.closeAd()
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
      Text(this.obj.adTime === 0 ? '跳过' : `${this.obj.adTime}秒后跳过`)
        .height(30)
        .backgroundColor('#66999999')
        .padding({
          left: 10,
          right: 10,
          top: 5,
          bottom: 5
        })
        .margin({ right: 15 , top: 40})

        .borderRadius(13)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center).onClick(()=> {
          this.closeAd()
      })
    }
  }
}