/*
path: app.config.js
completePath: front-end/app.config.js
unique_id: i1kD8rNJUh4
*/

import 'dotenv/config'

export default {
  expo: {
    name: "{{ insert_setting('fancyName')|default(application.settings.name) }}",
    slug: "{{ application.settings.name | lower | friendly }}app",
    version: "{{ insert_setting('version')|default('1.0.0') }}",
    orientation: 'portrait',

    icon: './assets/img/icon.png',

    splash: {
      image: './assets/img/splash.png',
      resizeMode: "{{ insert_setting('resizeMode')|default('contain') }}",
      backgroundColor: '#ffffff',
    },

    updates: {
      fallbackToCacheTimeout: 0,
    },

    assetBundlePatterns: ['**/*'],

    experiments: {
      tsconfigPaths: true,
    },

    ios: {
      {{ insert_setting('AppJsonIos') | raw }}
      supportsTablet: {{ insert_setting('supportsTablet')|default('true') }},
      bundleIdentifier: 'com.weblabs.{{ application.settings.name | lower | friendly }}',
      buildNumber: "{{ insert_setting('versionCode')|default('1') }}",
      googleServicesFile: './GoogleService-Info.plist',

      /** ⬇️ FACEBOOK iOS ⬇️ */
      infoPlist: {
        FacebookAppID: process.env.EXPO_PUBLIC_FACEBOOK_APP_ID,
        FacebookClientToken: process.env.EXPO_PUBLIC_FACEBOOK_CLIENT_TOKEN,
        FacebookDisplayName: "{{ insert_setting('fancyName')|default(application.settings.name) }}",
        FacebookAdvertiserIDCollectionEnabled: false,
        FacebookAutoInitEnabled: false,
        FacebookAutoLogAppEventsEnabled: false,
      },
    },

    android: {
      {{ insert_setting('AppJsonAndroid') | raw }}
      package: "{{ insert_setting('androidPackage')|default('com.aptugo.' ~ application.settings.name | lower | friendly) }}",
      versionCode: {{ insert_setting('versionCode')|default('1') }},
      googleServicesFile: './google-services.json',

      /** ⬇️ FACEBOOK Android ⬇️ */
      manifestPlaceholders: {
        FACEBOOK_APP_ID: process.env.EXPO_PUBLIC_FACEBOOK_APP_ID,
        FACEBOOK_CLIENT_TOKEN: process.env.EXPO_PUBLIC_FACEBOOK_CLIENT_TOKEN,
      },
    },

    web: {
      favicon: './assets/img/favicon.png',
    },

    scheme: "{{ insert_setting('androidPackage')|default(application.settings.name | lower | friendly) }}",

    plugins: [
      {{ insert_setting('AppJsonPlugins') | raw }}
      [
        'expo-build-properties',
        {
          ios: {
            deploymentTarget: '15.1',
          },
        },
      ],
      [
        'expo-image-picker',
        {
          photosPermission:
            'The app accesses your photos to let you share them with your friends.',
        },
      ],
    ],

    extra: {
      react: {
        transformer: 'react-native-sass-transformer',
      },
      eas: {
        projectId: 'fc785f32-a731-4a1a-9ce6-6964a5729095',
      },
    },

    owner: 'aptugo',
  },
}
