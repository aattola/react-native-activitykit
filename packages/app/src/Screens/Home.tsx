import React from 'react'
import { Button, StyleSheet, Text, View } from 'react-native'
import { NativeModules } from 'react-native'

const styles = StyleSheet.create({
  homeContainer: { flex: 1, alignItems: 'center', justifyContent: 'center' }
})

console.log(NativeModules.Activity)

function HomeScreen() {
  return (
    <View style={styles.homeContainer}>
      <Text>Home Screen</Text>

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
    </View>
  )
}

export { HomeScreen }
