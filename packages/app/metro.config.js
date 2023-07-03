const { getDefaultConfig, mergeConfig } = require('@react-native/metro-config');
const { resolve } = require('path');

/**
 * Metro configuration
 * https://facebook.github.io/metro/docs/configuration
 *
 * @type {import('metro-config').MetroConfig}
 */

const watchFolders = [resolve(__dirname, '../..', 'node_modules')];

const config = {
  watchFolders
};

module.exports = mergeConfig(getDefaultConfig(__dirname), config);
