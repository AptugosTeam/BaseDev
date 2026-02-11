/*
path: SignGoogle.tpl
type: file
unique_id: qgwpCNG
settings:
  - name: Packages
    value: '"expo-web-browser": "~12.3.2", "expo-auth-session": "~5.0.2",'
options:
  - name: varUserInfo
    display: Name Variable userInfo
    type: text
    options: ''
  - name: varAndroidClientId
    display: Name Variable androidClientId
    type: text
    options: ''
  - name: varIosClientId
    display: Name Variable iosClientId
    type: text
    options: ''
  - name: varWebClientId
    display: Name Variable webClientId
    type: text
    options: ''
*/
{% set bpr %}
import { useEffect, useState } from "react";
import * as WebBrowser from "expo-web-browser";
import * as Google from "expo-auth-session/providers/google";
import AsyncStorage from "@react-native-async-storage/async-storage";

WebBrowser.maybeCompleteAuthSession();
{% endset %}
{{ save_delayed('bpr',bpr) }}

{% set ph %}
  const [Token, setToken] = useState("");
  const [{{ element.values.varUserInfo | default('userInfo') }}, set{{ element.values.varUserInfo | default('userInfo') }}] = useState(null);

  const [request, response, promptAsync] = Google.useAuthRequest({
    {% if element.values.varAndroidClientId %}androidClientId: "{{ element.values.varAndroidClientId }}",{% endif %}
    {% if element.values.varIosClientId %}iosClientId: "{{ element.values.varIosClientId }}",{% endif %}
    {% if element.values.varWebClientId %}webClientId: "{{ element.values.varWebClientId }}",{% endif %}
  });

  useEffect(() => {
    handleEffect();
  }, [response, Token]);

  async function handleEffect() {
    const user = await getLocalUser();
    if (!user) {
      if (response?.type === "success") {
        getUserInfo(response?.authentication?.accessToken);
      }
    } else {
      set{{ element.values.varUserInfo | default('userInfo') }}(user);
    }
  }

  const getLocalUser = async () => {
    const data = await AsyncStorage.getItem("@user");
    if (!data) return null;
    return JSON.parse(data);
  };

  const getUserInfo = async (Token) => {
    if (!Token) return;
    try {
      const response = await fetch(
        "https://www.googleapis.com/userinfo/v2/me",
        {
          headers: { Authorization: `Bearer ${Token}` },
        }
      );

      const user = await response.json();
      await AsyncStorage.setItem("@user", JSON.stringify(user));
      set{{ element.values.varUserInfo | default('userInfo') }}(user);
    } catch (error) {
      console.log(error)
    }
  };
{% endset %}
{{ save_delayed('ph',ph) }}