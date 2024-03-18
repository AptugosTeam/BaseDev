/*
path: Firebase.tpl
completePath: elements/Experimental/Firebase.tpl
type: file
unique_id: MdBfgy9K
icon: f:Stripe.svg
helpText: Use Initialize Firebase
children: []
options:
  - name: firebase
    display: ''
    type: text
    options: ''
  - name: config
    display: Config firebase
    type: code
    options: ''
settings:
    
  - name: BackendPackages
    value: '"stripe": "^8.201.0",'
  - name: ServerRoute
    value: |
        const firebaseConfig = {{ element.values.config }}
        const firebase = require('@react-native-firebase/app')
        firebase.initializeApp(firebaseConfig)
*/
