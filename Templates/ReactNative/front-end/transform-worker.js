/*
path: transform-worker.js
completePath: /Users/Shared/Dev/BaseDev/Templates/ReactNative/front-end/transform-worker.js
keyPath: front-end/transform-worker.js
unique_id: 3RDSbM1i
*/
const worker = require("@expo/metro-config/build/transform-worker/metro-transform-worker.js");

async function transform(config, projectRoot, filename, data, options) {
  const environment = options.customTransformOptions?.environment;
  const isClientEnvironment =
    environment !== "node" && environment !== "react-server";
  if (
    isClientEnvironment &&
    (filename.match(
      new RegExp(`^app/\\+html(\\.${options.platform})?\\.([tj]sx?|[cm]js)?$`)
    ) ||
      filename.match(/\+api(\.(native|ios|android|web))?\.[tj]sx?$/))
  ) {
    return worker.transform(
      config,
      projectRoot,
      filename,
      !options.minify
        ? Buffer.from(
            '"> The server-only file was removed from the client JS bundle by Expo CLI."'
          )
        : Buffer.from(""),
      options
    );
  }

  if (
    isClientEnvironment &&
    !filename.match(/\/node_modules\//) &&
    filename.match(/\+api(\.(native|ios|android|web))?\.[tj]sx?$/)
  ) {
    return worker.transform(
      config,
      projectRoot,
      filename,
      Buffer.from(""),
      options
    );
  }

  return worker.transform(config, projectRoot, filename, data, options);
}

module.exports = transform;

module.exports = {
  ...worker,
  transform,
};