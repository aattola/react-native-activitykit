module.exports = {
  root: true,
  plugins: ['import'],
  extends: ['@react-native', 'prettier'],
  rules: {
    'import/no-default-export': 'error',
    'prettier/prettier': [
      'error',
      {
        arrowParens: 'avoid',
        bracketSpacing: true,
        singleQuote: true,
        trailingComma: 'none',
        printWidth: 80,
        bracketSameLine: false,
        semi: false
      }
    ]
  }
}
