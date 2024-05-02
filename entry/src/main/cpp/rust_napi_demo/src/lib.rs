use napi_derive_ohos::napi;

#[napi]
pub fn add(left: u32, right: u32) -> u32 {
    left + right
}

#[link(name = "ace_napi.z")]
#[link(name = "ace_ndk.z")]
extern "C" {

}

