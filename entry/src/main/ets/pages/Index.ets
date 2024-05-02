import { hilog } from '@kit.PerformanceAnalysisKit';
// Switch between Cpp and Rust by changing the imported so.
// import testNapi from 'libentry.so';
import testNapi from 'librust_napi_demo.so';

@Entry
@Component
struct Index {
  @State counter: number = 1;

  build() {
    Row() {
      Column() {
        Text(`Test NAPI addition ${this.counter} + 1 = ${testNapi.add(this.counter, 1)} `)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.counter += 1;
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
