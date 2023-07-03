import 'react-native'

export interface NativeActivityKit {
  start: (title: string) => Promise<void>
}

// and extend them!
declare module 'react-native' {
  interface NativeModulesStatic {
    NativeActivityKit: NativeActivityKit
  }
}
