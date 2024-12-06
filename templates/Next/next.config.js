/*
path: next.config.js
keyPath: next.config.js
unique_id: 43C2E80i
*/
/** @type {import('next').NextConfig} */
const regexEqual = (x, y) => {
  return (
    x instanceof RegExp &&
    y instanceof RegExp &&
    x.source === y.source &&
    x.global === y.global &&
    x.ignoreCase === y.ignoreCase &&
    x.multiline === y.multiline
  )
}

module.exports = {
  transpilePackages: ['mui-file-input'],
  typescript: {
    ignoreBuildErrors: true,
  },
  eslint: {
    ignoreDuringBuilds: true,
  },
  webpack: (config) => {
    const oneOf = config.module.rules.find((rule) => typeof rule.oneOf === 'object')

    if (oneOf) {
      const moduleCssRule = oneOf.oneOf.find((rule) => regexEqual(rule.test, /\.module\.(scss|sass)$/))

      if (moduleCssRule) {
        const cssLoader = moduleCssRule.use.find(({ loader }) => loader.includes('css-loader'))
        if (cssLoader) {
          cssLoader.options.modules.mode = 'local'
        }
      }
    }

    return config
  },
}
