/*
path: TabNavigation.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/ReactNative/elements/Experimental/Tabs/TabNavigation.tsx
keyPath: elements/Experimental/Tabs/TabNavigation.tsx
unique_id: VO1BT1Ny
*/
import React, { FunctionComponent } from 'react'
import { Animated, Dimensions, Image, Platform, SafeAreaView, ScrollView, StatusBar, StyleSheet, Text, TouchableOpacity, View } from 'react-native'
import classes from './tabnavigation.module.scss'

const TabNavigation: FunctionComponent<any> = (props) => {
  const inputRange = props.navigationState.routes.map((x, i) => i);

  console.log(props.navigationState)
    return (
      <View style={classes.tabBar}>
        {props.navigationState.routes.map((route, i) => {
          const color = i === props.navigationState.index ? '#FF0000' : '#000000'
          const borderBottomColor = i === props.navigationState.index ? '#FF0000' : '#FFFFFF'
          return (
            <TouchableOpacity
              style={ { ...classes.tabItem, borderBottomWidth: 1, borderBottomColor }}
              onPress={() => props.onPress(i)}>
              <Animated.Text style={{ fontSize: 11, color }}>{route.title}</Animated.Text>
            </TouchableOpacity>
          )
        })}
      </View>
    );
}

export default TabNavigation
