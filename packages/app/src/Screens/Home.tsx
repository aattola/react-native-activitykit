import React, { useState } from 'react'
import {
  Button,
  NativeModules,
  StyleSheet,
  Text,
  TextInput,
  View
} from 'react-native'

const styles = StyleSheet.create({
  homeContainer: { flex: 1, alignItems: 'center', justifyContent: 'center' }
})

function HomeScreen() {
  const [text, setText] = useState('')

  return (
    <View style={styles.homeContainer}>
      <Text>Kotinäyttö</Text>

      <TextInput
        style={{
          height: 50,
          width: 200,
          borderColor: 'gray',
          borderWidth: 2,
          borderRadius: 12,
          paddingHorizontal: 12,
          paddingVertical: 6
        }}
        onChangeText={t => setText(t)}
        value={text}
      />

      <Button
        title="Aloita"
        onPress={() => {
          NativeModules.NativeActivityKit.start('moi')
            .then(res => console.log(res))
            .catch(e => console.log(e.message, e.code))
          // const a = NativeModules.NativeActivityKit.start('oraava')
          // console.log(a)
        }}
      />

      <Button
        title="Lopeta"
        onPress={() => {
          NativeModules.NativeActivityKit.end()
            .then(res => console.log(res))
            .catch(e => console.log(e.message, e.code))
          // const a = NativeModules.NativeActivityKit.start('oraava')
          // console.log(a)
        }}
      />

      <Button
        title="Päivitä"
        disabled={!text}
        onPress={() => {
          NativeModules.NativeActivityKit.updateActivity(text)
            .then(res => console.log(res))
            .catch(e => console.log(e.message, e.code))
          // const a = NativeModules.NativeActivityKit.start('oraava')
          // console.log(a)
        }}
      />
    </View>
  )
}

export { HomeScreen }
