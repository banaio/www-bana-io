module.exports = {
  extends: [
    'vuepress',
    'standard',
    'plugin:vue/recommended',
    'prettier',
    'prettier/standard',
    'prettier/vue',
  ],

  rules: {
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
  },
  // overrides: [
  //   {
  //     files: ['*.js'],
  //     extends: ['vuepress'],
  //     parser: 'vue-eslint-parser',
  //     rules: {
  //       camelcase: [
  //         'error',
  //         {
  //           properties: 'never',
  //           ignoreDestructuring: true,
  //           ignoreGlobals: true,
  //           ignoreImports: true,
  //         },
  //       ],
  //     },
  //   },
  // ],
}

// module.exports = {
//   // extends: ['vuepress'],

//   extends: [
//     'vuepress',
//     'standard',
//     'plugin:vue/recommended',
//     'prettier',
//     'prettier/standard',
//     'prettier/vue',
//   ],

//   //   parserOptions: {
//   //     parser: 'babel-eslint'
//   //   },

//   plugins: ['vue', 'prettier'],

//   rules: {
//     camelcase: ['error', { properties: 'never', ignoreDestructuring: true }],
//     'vue/component-name-in-template-casing': [
//       'error',
//       'PascalCase',
//       {
//         registeredComponentsOnly: false,
//         ignores: [],
//       },
//     ],
//     'vue/match-component-file-name': [
//       'error',
//       {
//         extensions: ['js', 'jsx', 'vue'],
//         shouldMatchCase: false,
//       },
//     ],
//     'prettier/prettier': 'error',
//   },
// }

// module.exports = {
//     extends: [
//         'standard',
//         'plugin:vue/recommended',
//         'prettier',
//         'prettier/standard',
//         'prettier/vue',
//     ],

//     parserOptions: {
//         parser: 'babel-eslint',
//     },

//     plugins: ['vue', 'prettier'],

//     rules: {
//         'vue/component-name-in-template-casing': [
//             'error',
//             'PascalCase',
//             {
//                 registeredComponentsOnly: false,
//                 ignores: [],
//             },
//         ],
//         'vue/match-component-file-name': [
//             'error',
//             {
//                 extensions: ['js', 'jsx', 'vue'],
//                 shouldMatchCase: false,
//             },
//         ],
//         'prettier/prettier': 'error'
//     },
// }

// module.exports = {
//   root: true,

//   extends: [
//     'plugin:vue-libs/recommended',
//     'plugin:vue/recommended'
//   ],

//   rules: {
//     indent: ['error', 2, { MemberExpression: 'off' }],

//     'no-undef': ['error'],

//     'operator-linebreak': ['error', 'before'],

//     'vue/match-component-file-name': [
//       'error',
//       {
//         extensions: ['js', 'vue'],
//         shouldMatchCase: false
//       }
//     ]
//   }

//   // overrides: [
//   //   {
//   //     files: ['*.ts'],
//   //     extends: [
//   //       'plugin:@typescript-eslint/recommended'
//   //     ],
//   //     parser: 'vue-eslint-parser',
//   //     parserOptions: {
//   //       parser: '@typescript-eslint/parser'
//   //     },
//   //     rules: {
//   //       'no-useless-constructor': 'off'
//   //     }
//   //   },
//   //   {
//   //     files: [
//   //       '**/__tests__/**/*.spec.js',
//   //       '**/__tests__/**/*.spec.ts'
//   //     ],
//   //     extends: ['plugin:jest/recommended']
//   //   }
//   // ]
// }

// module.exports = {
//   extends: [
//     'standard',
//     'plugin:vue/recommended',
//     'prettier',
//     'prettier/standard',
//     'prettier/vue'
//   ],

//   parserOptions: {
//     parser: 'babel-eslint'
//   },

//   plugins: ['vue', 'prettier'],

//   rules: {
//     'vue/component-name-in-template-casing': [
//       'error',
//       'PascalCase',
//       {
//         registeredComponentsOnly: false,
//         ignores: []
//       }
//     ],
//     'vue/match-component-file-name': [
//       'error',
//       {
//         extensions: ['js', 'jsx', 'vue'],
//         shouldMatchCase: false
//       }
//     ],
//     'prettier/prettier': 'error'
//   }
// }

// module.exports = {
//     extends: [
//       'standard',
//       'plugin:vue/recommended',
//       'prettier',
//       'prettier/standard',
//       'prettier/vue',
//     ],

//     parserOptions: {
//       parser: 'babel-eslint',
//     },

//     plugins: ['vue', 'prettier'],

//     rules: {
//       'vue/component-name-in-template-casing': [
//         'error',
//         'PascalCase',
//         {
//           registeredComponentsOnly: false,
//           ignores: [],
//         },
//       ],
//       'vue/match-component-file-name': [
//         'error',
//         {
//           extensions: ['js', 'jsx', 'vue'],
//           shouldMatchCase: false,
//         },
//       ],
//       'prettier/prettier': 'error',
//     },
//   }
