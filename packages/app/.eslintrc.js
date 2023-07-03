module.exports = {
  root: true,
  extends: ['@react-native', 'prettier'],
  rules: {
    'prettier/prettier': [
      'error',
      {
        arrowParens: 'avoid',
        bracketSpacing: true,
        singleQuote: true,
        trailingComma: 'none',
        printWidth: 80,
        bracketSameLine: false
      }
    ]
  }
};
