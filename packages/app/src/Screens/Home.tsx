import React from 'react'
import { StyleSheet, Text, View } from 'react-native'

const styles = StyleSheet.create({
  homeContainer: { flex: 1, alignItems: 'center', justifyContent: 'center' }
})

function HomeScreen() {
  return (
    <View style={styles.homeContainer}>
      <Text>Home Screen</Text>
    </View>
  )
}

export { HomeScreen }
