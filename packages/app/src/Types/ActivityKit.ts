import 'react-native'

export interface NativeActivityKit {
  start: (title: string) => Promise<void>
  updateActivity: (message: string) => Promise<void>
  end: () => Promise<void>
}

// and extend them!
declare module 'react-native' {
  interface NativeModulesStatic {
    NativeActivityKit: NativeActivityKit
  }
}
