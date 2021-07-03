module.exports = {
  root: true,
  extends: [
    'vuepress',
    'standard',
    'plugin:vue-libs/recommended',
    'plugin:vue/recommended',
    'prettier',
    'prettier/standard',
    'prettier/vue',
    'plugin:prettier/recommended'
  ],
  rules: {
    indent: ['error', 2, { MemberExpression: 'off' }],
    'no-undef': ['error'],
    'operator-linebreak': ['error', 'before'],
    'vue/match-component-file-name': [
      'error',
      {
        extensions: ['js', 'vue'],
        shouldMatchCase: false,
      },
    ],
    camelcase: [
      'error',
      {
        properties: 'never',
        ignoreDestructuring: true,
        ignoreGlobals: true,
        ignoreImports: true,
        allow: ['^.*_.*$'],
      },
    ],
    'prettier/prettier': 'error'
  },
  plugins: ['json-format', 'prettier'],
  settings: {
    'json/sort-package-json': [
      'scripts',
      'devDependencies',
      'dependencies',
      'name',
      'version',
      'author',
      'description',
      'homepage',
      'repository',
      'bugs',
      'license',
      'private',
      'prettier',
      'pro'
    ],
    'json/ignore-files': ['**/package-lock.json'],
    'json/json-with-comments-files': [
      // '.vscode/**',
      '**/tsconfig.json',
      '**/jsconfig.json',
      '.vscode/settings.json',
      '.vscode/keybindings.json'
    ]
  },
}
