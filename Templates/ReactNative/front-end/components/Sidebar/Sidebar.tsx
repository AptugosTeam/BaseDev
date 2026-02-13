/*
path: Sidebar.tsx
completePath: front-end/components/Sidebar/Sidebar.tsx
unique_id: eagUHEvx
*/
import React, { FunctionComponent, PropsWithChildren } from 'react'
import { Animated, Text, TouchableOpacity, View,Platform, SafeAreaView, StatusBar, StyleSheet, } from 'react-native'

import classes from './sidebar.module.scss'

const sc = StyleSheet.create({
  droidSafeArea: {
    flex: 1,
    paddingTop: Platform.OS === 'android' ? StatusBar.currentHeight : 0,
  },
})

type FadeInViewProps = PropsWithChildren<{style?:any, onClosed?:any}>;

const SlideAnimation:React.FC<FadeInViewProps> = props => {
  const slideAnim = React.useRef(new Animated.Value(-240)).current

  React.useEffect(() => {
    Animated.timing(slideAnim, {
      toValue: 0,
      duration: 325,
      useNativeDriver: true,
    }).start();
  }, []);

  const slideOut = () => {
    Animated.timing(slideAnim, {
      toValue: -240,
      duration: 325,
      useNativeDriver: true,
    }).start(props.onClosed || undefined)
  };

  return (<TouchableOpacity
    style={classes.dimm}
    onPress={slideOut}
    activeOpacity={1}
    >
      <Animated.View
        style={ { ...classes.drawer,
          transform: [{ translateX: slideAnim }],
        }}
      >
        {props.children}
      </Animated.View>
    </TouchableOpacity>
  );
};

interface sidebarProps {
  handleDrawerToggle?: VoidFunction
  open: boolean
  color: string
}

const Sidebar: FunctionComponent<PropsWithChildren<sidebarProps>> = (props) => {
  const localClasses = {
    [classes.drawerOpen]: props.open,
    [classes.drawerClose]: !props.open,
    [classes[`color${props.color}`]]: true,
  }


  if (!props.open) return <></>
  return (<SlideAnimation style={classes.drawer} onClosed={props.handleDrawerToggle}>
      <View style={classes.drawer}>
        <SafeAreaView style={sc.droidSafeArea}>
          {props.children}
        </SafeAreaView>
      </View>
    </SlideAnimation>)
}

export default Sidebar