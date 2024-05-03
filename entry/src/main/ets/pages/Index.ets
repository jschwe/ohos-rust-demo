import { hilog } from '@kit.PerformanceAnalysisKit';
// Switch between C++, Rust by changing the imported so.
// import testNapi from 'libentry.so';
// import testNapi from 'librust_napi_demo.so';

function add(a: number, b: number) {
  return a + b;
}

@Entry
@Component
struct Index {
  @State counter: number = 1;

  build() {
    Row() {
      Column() {
        Text('Test addition: ')
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        // Use `testNapi.add(this.counter, 1)` to use native code.
        Text(`${this.counter} + 1 = ${ add(this.counter, 1) } `)
          .fontSize(50)
          .textAlign(TextAlign.Center)
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
