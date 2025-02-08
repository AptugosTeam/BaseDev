/*
name: hamburgerMenu
path: hamburgerMenu.tpl
unique_id: DJAy2q4bHMhm
icon: f:dataTable.svg
helpText: Hamburger Menu
options:
  - name: var
    display: Name Variable
    type: text
    options: ''
  - name: background
    display: Background Color for the line
    type: text
    options: ''
children: []
*/
{% set bpr %}
import { Animated } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { Easing } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr ) }}
{% set bpr %}
import { StyleSheet } from 'react-native'
{% endset %}
{{ save_delayed('bpr', bpr ) }}

{% set ph %}
 const [{{ element.values.var }}, set{{ element.values.var }}] = React.useState<any>(false)
{% endset %}
{{ save_delayed('ph', ph, 1) }}
{% set ph %}
 const animation = React.useRef(new Animated.Value(0)).current

  const line1Transform = animation.interpolate({
    inputRange: [0, 0.5, 1],
    outputRange: ["0deg", "0deg", "45deg"],
  })

  const line2Opacity = animation.interpolate({
    inputRange: [0, 0.5, 1],
    outputRange: [1, 1, 0], 
  })

  const line3Transform = animation.interpolate({
    inputRange: [0, 0.5, 1],
    outputRange: ["0deg", "0deg", "-45deg"],
  })

  const line1Y = animation.interpolate({
    inputRange: [0, 0.5, 1],
    outputRange: [-8, -8, 0], 
  })

  const line3Y = animation.interpolate({
    inputRange: [0, 0.5, 1],
    outputRange: [8, 8, 0], 
  })

   React.useEffect(() => {
    Animated.timing(animation, {
      toValue: {{ element.values.var }} ? 1 : 0,
      duration: 400,
      easing: Easing.ease,
      useNativeDriver: true,
    }).start();
  }, [{{ element.values.var }}])

const stylesHamburgerMenu = StyleSheet.create({
  menuHamburguesaContainer: {
    width: 24,
    height: 24,
    justifyContent: "center",
    alignItems: "center",
  },
  menuHamburguesaLine: {
    width: 24,
    height: 2,
    backgroundColor: '{{element.values.background | default('#FFFFFF')}}',
    position: "absolute",
    borderRadius: 2,
  },
})
{% endset %}
{{ save_delayed('ph', ph ) }}
  <TouchableOpacity activeOpacity={1} onPress={() => set{{ element.values.var }}(!{{ element.values.var }})}>
    <View style={stylesHamburgerMenu.menuHamburguesaContainer}>
      <Animated.View
        style={[
          stylesHamburgerMenu.menuHamburguesaLine,
          {
            transform: [{ translateY: line1Y }, { rotate: line1Transform }],
          },
        ]}
      />
      <Animated.View
        style={[
          stylesHamburgerMenu.menuHamburguesaLine,
          { opacity: line2Opacity },
        ]}
      />
      <Animated.View
        style={[
          stylesHamburgerMenu.menuHamburguesaLine,
          {
            transform: [{ translateY: line3Y }, { rotate: line3Transform }],
          },
        ]}
      />
    </View>
  </TouchableOpacity>

