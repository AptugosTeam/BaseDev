/*
path: NotificationBannerIndex.tsx
keyPath: elements/99_ExtraFiles/NotificationBannerIndex.tsx
unique_id: lr1WWBUP
*/
import React from 'react'
import { Animated, Dimensions, Easing, Image, Platform, StyleSheet, Text, TouchableOpacity, View } from 'react-native'
// import * as Haptics from 'expo-haptics'
import { registerNotificationHandler, unregisterNotificationHandler } from '@components/NotificationBanner/notificationService'
import { Audio } from 'expo-av'

const { width: SCREEN_WIDTH } = Dimensions.get('window')

type Props = {}

type State = {
  visible: boolean
  fromName?: string
  message?: string
  avatar?: string
  onPress?: () => void
  numberOfLines?: number
}

export default class NotificationBanner extends React.PureComponent<Props, State> {
  animY = new Animated.Value(-120) // banner starts above screen
  animOpacity = new Animated.Value(0)
  hideTimeout: any = null
  sound: Audio.Sound | null = null

  constructor(props: Props) {
    super(props)
    this.state = { visible: false }
  }

  componentDidMount() {
    // Register the global show function
    registerNotificationHandler(this.show)
  }

  componentWillUnmount() {
    unregisterNotificationHandler()
    if (this.sound) {
      this.sound.unloadAsync().catch(() => {})
      this.sound = null
    }
  }

  playSound = async () => {
    try {
      // Try to load a sound located at ./assets/notification.mp3
      // If you don't have a file, comment this out and use vibration only.
      const { sound } = await Audio.Sound.createAsync(require('./assets/notification.mp3'))
      this.sound = sound
      await sound.playAsync()
    } catch (e) {
      // fallback: vibration only
    }
  }

  vibrate = () => {
    try {
      // Haptics.notificationAsync(Haptics.NotificationFeedbackType.Success)
    } catch (e) {
      // older devices: ignore
    }
  }

  show = async (payload: { fromName?: string; message?: string; avatar?: string; onPress?: () => void; duration?: number, numberOfLines?: number }) => {
    if (this.hideTimeout) {
      clearTimeout(this.hideTimeout)
      this.hideTimeout = null
    }

    this.setState({
      visible: true,
      fromName: payload.fromName,
      message: payload.message,
      avatar: payload.avatar,
      onPress: payload.onPress,
      numberOfLines: payload.numberOfLines
    })

    // feedback
    this.vibrate()
    this.playSound().catch(() => {})

    // animate in
    Animated.parallel([
      Animated.timing(this.animY, {
        toValue: 0,
        duration: 300,
        useNativeDriver: true,
        easing: Easing.out(Easing.cubic),
      }),
      Animated.timing(this.animOpacity, {
        toValue: 1,
        duration: 250,
        useNativeDriver: true,
      }),
    ]).start()

    // auto-hide
    const duration = payload.duration ?? 3000
    this.hideTimeout = setTimeout(() => this.hide(), duration)
  }

  hide = () => {
    if (this.hideTimeout) {
      clearTimeout(this.hideTimeout)
      this.hideTimeout = null
    }
    Animated.parallel([
      Animated.timing(this.animY, {
        toValue: -120,
        duration: 250,
        useNativeDriver: true,
        easing: Easing.in(Easing.cubic),
      }),
      Animated.timing(this.animOpacity, {
        toValue: 0,
        duration: 200,
        useNativeDriver: true,
      }),
    ]).start(() => {
      this.setState({ visible: false, fromName: undefined, message: undefined, avatar: undefined, onPress: undefined })
    })
  }

  handlePress = () => {
    const { onPress } = this.state
    this.hide()
    if (onPress) onPress()
  }

  render() {
    const { visible, fromName, message, avatar, numberOfLines } = this.state

    // If not visible, render null to avoid intercepting touches
    if (!visible) return null

    return (
      <Animated.View
        pointerEvents="box-none"
        style={[
          styles.container,
          {
            transform: [{ translateY: this.animY }],
            opacity: this.animOpacity,
          },
        ]}
      >
        <TouchableOpacity activeOpacity={0.9} onPress={this.handlePress} style={styles.banner}>
          {avatar && <Image source={ { uri: avatar }} style={styles.avatar} resizeMode="cover" />}
          <View style={styles.textContainer}>
            <Text numberOfLines={1} style={styles.name}>
              {fromName ?? 'New message'}
            </Text>
            <Text numberOfLines={numberOfLines || 2} style={styles.message}>
              {message ?? ''}
            </Text>
          </View>
        </TouchableOpacity>
      </Animated.View>
    )
  }
}

const STATUS_BAR_OFFSET = Platform.OS === 'ios' ? 44 : 20
const BANNER_HEIGHT = 72

const styles = StyleSheet.create({
  container: {
    position: 'absolute',
    top: 0,
    left: 0,
    width: SCREEN_WIDTH,
    zIndex: 9999,
    // allow content below to be visible (banner has marginTop)
  },
  banner: {
    marginTop: STATUS_BAR_OFFSET,
    marginHorizontal: 8,
    height: BANNER_HEIGHT,
    borderRadius: 12,
    backgroundColor: '#075E54', // whatsapp-like green
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 12,
    elevation: 6,
    shadowColor: '#000',
    shadowOpacity: 0.2,
    shadowRadius: 6,
    shadowOffset: { width: 0, height: 2 },
  },
  avatar: {
    width: 52,
    height: 52,
    borderRadius: 26,
    marginRight: 12,
    backgroundColor: '#ddd',
  },
  textContainer: {
    flex: 1,
    justifyContent: 'center',
  },
  name: {
    color: '#fff',
    fontWeight: '700',
    fontSize: 16,
  },
  message: {
    color: '#fff',
    opacity: 0.9,
    marginTop: 2,
    marginBottom: 2
  },
})
