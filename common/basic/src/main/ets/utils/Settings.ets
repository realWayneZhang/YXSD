import { preferences } from '@kit.ArkData'
import { Context } from '@kit.AbilityKit'
import { AdvertModel } from '../models/advert'
import json from '@ohos.util.json'
import { JSON } from '@kit.ArkTS'


// 广告的默认配置
export const defaultAd: AdvertModel = {
  adTime: 10,
  showAd: true,
  adUrl: $r('app.media.ad')
}

export class UserPreferences {
  context: Context

  constructor(context: Context) {
    this.context = context
  }


  // 首选项存储 ---》 必须要有仓库
  get storeShared(): preferences.Preferences {
    return preferences.getPreferencesSync(this.context, { name: 'com.juswin.youniu.shared_preferences' })
  }


  // 存储广告数据
  setUserAd(ad: AdvertModel) {
    const store = this.storeShared;
    // 给仓库中存储数据
    store.putSync('ad', JSON.stringify(ad))
    store.flush()
  }

  // 获取数据
  get userAd(): AdvertModel {
    const store = this.storeShared;
    let m = JSON.parse(store.getSync('ad', JSON.stringify(defaultAd)) as string)
    return m as AdvertModel
  }
}