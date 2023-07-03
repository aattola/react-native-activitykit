/**
 * @format
 */
import { name as appName } from './app.json'
import { RootComponent } from './src/Root'
import { AppRegistry } from 'react-native'

AppRegistry.registerComponent(appName, () => RootComponent)
