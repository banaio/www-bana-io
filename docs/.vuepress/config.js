/**
 * VuePress config file: `docs/.vuepress/config.js`.
 * Documentation: https://vuepress.vuejs.org/config/.
 * https://github.com/ycmjason/ycmjason.com/blob/master/.vuepress/config.js
 */

const fs = require('fs');
const path = require('path');
const util = require('util');
// https://www.npmjs.com/package/debug
const debug = require('debug');
const debug_config = require('debug')('config');
const debug_vuepress = require('debug')('config:vuepress');
const debug_copy = require('debug')('config:copy');
const inspect_options = { compact: true, depth: 1, breakLength: Infinity /*80*/, showHidden: false, colors: true, sorted: true, getters: true };

console.log('config.js: debug.enabled=%o', debug.enabled);

// // https://github.com/visionmedia/debug/issues/582#issuecomment-418185850
// // https://github.com/visionmedia/debug/issues/582
const log_original = debug.log;
function log_new(args) {
    const STACK_INDEX = 3;

    const stack = (new Error()).stack.split('\n');
    // get text between two parentheses
    // '    at copyAllStaticFiles (/home/mbana/dev/bana-io/www-bana-io-vue-js/docs/.vuepress/config.js:134:13)'
    // ->
    //
    // Match 1
    // Full match	26-102	(/home/mbana/dev/bana-io/www-bana-io-vue-js/docs/.vuepress/config.js:134:13)
    // Group 1.	27-101	/home/mbana/dev/bana-io/www-bana-io-vue-js/docs/.vuepress/config.js:134:13
    const line = stack[STACK_INDEX].match(/\(([^)]+)\)/)[1];
    const func_name = stack[STACK_INDEX].match(/at (.*?) /)[1];

    // args = [args, debug.colors[5] + '(' + func_name + ':' + line + ')' + debug.colors[5]].join(' ');
    args = [args, '\u001b[38;5;201;1m(' + func_name + ':' + line+ ')\u001b[0m'].join(' ');
    log_original(args);
};
debug.log = log_new;
debug_config.log = log_new;
debug_vuepress.log = log_new;
debug_copy.log = log_new;

// https://gist.github.com/kethinov/6658166
// List all files in a directory in Node.js recursively in a synchronous fashion
const allFilesSync = (dir, fileList = []) => {
    fs.readdirSync(dir).forEach(file => {
        const filePath = path.join(dir, file);
        fileList.push(
            fs.statSync(filePath).isDirectory()
                ? { [file]: allFilesSync(filePath) }
                : file
        );
    });
    return fileList;
};

const copyStaticFilesToPublic = () => {
    // const doNotCopyFilenames = [
    //     // new RegExp("^.*\\.md$"),
    //     new RegExp(/^.*\.(md)(\?.*)?$/),
    // ];
    const copyFileNames = [
        // new RegExp("^.*\\.pdf$"),
        // new RegExp(/^.*\.(pdf)(\?.*)?$/),
        // /^.*(?<!\.md)$/gi,

        // NB:
        // Negative Lookbehind (?<!\.(md|png|jpe?g|gif|webp|svg|mp4|webm|ogg|mp3|wav|flac|aac|woff2?|eot|ttf|otf))
        // Assert that the Regex below does not match
        // new RegExp(/^.*(?<!\.(md|mp4|webm|ogg|mp3|wav|flac|aac|woff2?|eot|ttf|otf))$/iug),
        new RegExp(/^.*(?<!\.(md|mp4|webm|ogg|mp3|wav|flac|aac|woff2?|eot|ttf|otf))$/iu),

        // new RegExp(/^.*(?<!\.(md|png|jpe?g|gif|webp|svg|mp4|webm|ogg|mp3|wav|flac|aac|woff2?|eot|ttf|otf))$/i),
    ];
    const doNotCopyFolderNames = [
        new RegExp(/^.*\.vuepress$/iug),
        new RegExp(/^.*\.cache$/iug),
        new RegExp(/^.*\.temp$/iug),
        new RegExp(/^.*dist$/iug),
    ];
    // debug_copy('copyFileNames=%o', copyFileNames);
    // debug_copy('doNotCopyFolderNames=%o', doNotCopyFolderNames);

    const pathToPublicFolder = path.resolve(__dirname, "public");
    const pathToSrcFolder = path.resolve(__dirname, "../");
    // debug_copy('pathToPublicFolder=%o', pathToPublicFolder);
    // debug_copy('pathToSrcFolder=%o', pathToSrcFolder);

    // if (fs.existsSync(pathToPublicFolder)) {
    //     fs.rmdirSync(pathToPublicFolder, { recursive: true }); // Requires latest version of node.
    // }

    const copyAllStaticFiles = (pathToSourceFolder, pathToDestinationFolder) => {
        // debug_copy('pathToSourceFolder=%O', pathToSrcFolder);
        // debug_copy('pathToDestinationFolder=%O', pathToDestinationFolder);

        if (!fs.existsSync(pathToDestinationFolder)) {
            debug_copy('!fs.existsSync(pathToDestinationFolder) - CREATING pathToDestinationFolder=%o', pathToDestinationFolder);
            fs.mkdirSync(pathToDestinationFolder);
        } else {
            debug_copy('fs.existsSync(pathToDestinationFolder) - SKIPPING pathToDestinationFolder=%o', pathToDestinationFolder);
        }

        const names = fs.readdirSync(
            pathToSourceFolder
        );
        // debug_copy('readdirSync names=%O', names);

        for (const name of names) {
            const pathToSource = path.resolve(
                pathToSourceFolder,
                name
            );
            const pathToDestination = path.resolve(
                pathToDestinationFolder,
                name
            );
            debug_copy('resolve name=%o', name);
            debug_copy('resolve pathToSource=%o', pathToSource);
            debug_copy('resolve pathToDestination=%o', pathToDestination);

            if (fs.lstatSync(pathToSource).isDirectory()) {
                if (doNotCopyFolderNames.some(regexp => regexp.test(name))) {
                    debug_copy('fs.lstatSync(pathToSource).isDirectory() - SKIPPING doNotCopyFolderNames name=%o', name);
                } else {
                    const isEmptyDir = fs.readdirSync(pathToSource).length === 0;
                    if (!isEmptyDir) {
                        debug_copy('fs.lstatSync(pathToSource).isDirectory() - !isEmptyDir - RECURSE doNotCopyFolderNames name=%o', name);
                        copyAllStaticFiles(pathToSource, pathToDestination);
                    } else {
                        debug_copy('fs.lstatSync(pathToSource).isDirectory() - isEmptyDir - RECURSE doNotCopyFolderNames name=%o', name);
                    }
                }
            } else {
                if (copyFileNames.some(regexp => regexp.test(name))) {
                    debug_copy('copyFileNames.some(regexp => regexp.test(name)) - CREATE copyFileNames name=%o', name);
                    fs.copyFileSync(pathToSource, pathToDestination);
                } else {
                    debug_copy('copyFileNames.some(regexp => regexp.test(name)) - SKIPPING copyFileNames name=%o', name);
                }

                // old
                // if (!doNotCopyFilenames.some(regexp => regexp.test(name))) {
                //     fs.copyFileSync(pathToSource, pathToDestination);
                // }
            }
        }
    };

    copyAllStaticFiles(pathToSrcFolder, pathToPublicFolder);
    allFilesSync(pathToPublicFolder);
    // const publicTree = allFilesSync(pathToPublicFolder);
    // debug_copy('----------------------------------------');
    // debug_copy(util.formatWithOptions({
    //     getters: true,
    //     showHidden: true,
    //     depth: Infinity,
    //     colors: true,
    //     customInspect: true,
    //     showProxy: true,
    //     maxArrayLength: Infinity,
    //     maxStringLength: null,
    //     breakLength: Infinity,
    //     compact: false,
    //     sorted: false,
    // }, 'copyAllStaticFiles - FINISHED publicTree=%o', publicTree));
    // debug_copy('----------------------------------------');
};

module.exports = {
    // https://vuepress.vuejs.org/config/#basic-config
    title: 'BanaIO',
    description: 'The Builder',
    // description: 'Mohamed Bana—The Builder',
    // https://vuepress.vuejs.org/config/#head
    head: [
        ['link', { rel: 'icon', href: '/favicon.ico' }],
        ['link', { rel: 'manifest', href: '/manifest.json' }],
        // [
        //     'link',
        //     {
        //         rel: 'stylesheet',
        //         href: 'https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext',
        //     }
        // ],
        [
            'link',
            {
                rel: 'stylesheet',
                href: 'https://fonts.googleapis.com/css2?family=Alegreya+SC:ital,wght@0,400;0,500;0,700;0,800;0,900;1,400;1,500;1,700;1,800;1,900&family=Alegreya+Sans+SC:ital,wght@0,100;0,300;0,400;0,500;0,700;0,800;0,900;1,100;1,300;1,400;1,500;1,700;1,800;1,900&family=Alegreya+Sans:ital,wght@0,100;0,300;0,400;0,500;0,700;0,800;0,900;1,100;1,300;1,400;1,500;1,700;1,800;1,900&family=Alegreya:ital,wght@0,400;0,500;0,700;0,800;0,900;1,400;1,500;1,700;1,800;1,900&display=swap',
            }
        ],
        // ['link', { rel: 'icon', href: 'favicon.png' }],
        // [
        //     'link',
        //     {
        //         rel: 'stylesheet',
        //         href: 'https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i|Roboto+Mono:100,100i,300,300i,400,400i,500,500i,700,700i|Roboto+Slab:100,300,400,700|Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese',
        //     }
        // ],
        // [
        //     'link',
        //     {
        //         rel: 'stylesheet',
        //         href: 'https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i|Montserrat:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i|Reem+Kufi&amp;subset=arabic,cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese',
        //     }
        // ],
    ],
    // https://vuepress.vuejs.org/theme/default-theme-config.html
    themeConfig: {
        logo: 'favicon.png',
        nav: [
            // {
            //     text: 'Projects',
            //     items: [
            //         {
            //             text: 'openbankingforgerock',
            //             link: 'https://github.com/banaio/openbankingforgerock',
            //         },
            //         {
            //             text: 'go-gdax',
            //             link: 'https://github.com/banaio/go-gdax',
            //         },
            //         {
            //             text: 'go_gdax_fix',
            //             link: 'https://github.com/banaio/go_gdax_fix',
            //         },
            //         {
            //             text: 'vue_js_samples',
            //             link: 'https://github.com/banaio/vue_js_samples',
            //         },
            //         {
            //             text: 'go_samples',
            //             link: 'https://github.com/banaio/go_samples',
            //         },
            //         {
            //             text: 'www-bana-io-vue-js',
            //             link: 'https://github.com/banaio/www-bana-io-vue-js',
            //         },
            //     ],
            // },
            {
                text: 'm@bana.io',
                link: 'mailto:m@bana.io',
            },
            {
                text: 'GitHub',
                items: [
                    {
                        text: 'GitHub - BanaIO',
                        link: 'https://github.com/banaio',
                    },
                    {
                        text: 'GitHub - mbana',
                        link: 'https://github.com/mbana',
                    },
                ]
            },
            // {
            //     text: 'GitHub',
            //     items: [
            //         {
            //             text: 'LinkedIn',
            //             link: 'https://uk.linkedin.com/in/mbana',
            //         },
            //         {
            //             text: 'Twitter',
            //             link: 'https://twitter.com/m_bana/',
            //         },
            //     ]
            // },
            // {
            //     text: 'Twitter',
            //     link: 'https://twitter.com/m_bana/',
            // },
            {
                text: 'LinkedIn',
                link: 'https://uk.linkedin.com/in/mbana',
            },
            {
                text: 'Resume',
                link: '/resume/',
                items: [
                    {
                        text: 'CV',
                        link: '/resume/cv',
                    },
                    {
                        text: 'CV Download',
                        link: '/resume/cv-download',
                    },
                    {
                        text: 'Cover Letter',
                        link: '/resume/cover-letter',
                    },
                    {
                        text: 'About Me',
                        link: '/resume/about-me',
                    },
                ]
            },
            {
                text: 'CV Download',
                link: '/resume/cv-download',
            },
            {
                text: 'Blog',
                link: '/blog/',
            },
            {
              text: 'Rust Lang',
              link: '/rust/',
              items: [
                  {
                      text: 'Rust Lang',
                      link: '/rust/',
                  },
                  {
                      text: 'Rust Lang projects',
                      link: '/rust/projects',
                  },
                  {
                      text: 'Install',
                      link: '/rust/install',
                  },
              ]
          },
            {
                text: 'Linux',
                link: '/linux/',
            },
            // {
            //     text: 'The Quran',
            //     link: '/the-quran/',
            // },
        ],
        sidebar: 'auto',
        sidebarDepth: 0,
        displayAllHeaders: true,

        // // https://vuepress.vuejs.org/theme/default-theme-config.html#search-box
        // searchMaxSuggestions: 20,
        // https://vuepress.vuejs.org/theme/default-theme-config.html#smooth-scrolling
        smoothScroll: false,
        // https://vuepress.vuejs.org/theme/default-theme-config.html#last-updated
        // lastUpdated: true,
        lastUpdated: 'Last Updated',

        // serviceWorker: {
        //     updatePopup: {
        //         message: "New content is available.",
        //         buttonText: "Refresh"
        //     }
        // },
    },
    // serviceWorker: true,
    // permalink: ':slug',
    plugins: [
        // https://vuepress.vuejs.org/plugin/official/plugin-back-to-top.html
        '@vuepress/back-to-top',
        // https://vuepress.vuejs.org/plugin/official/plugin-nprogress.html
        '@vuepress/nprogress',
        // '@vuepress/blog': {
        //     postsDir: 'blog',
        //     permalink: ':regular',
        // },
        // '@vuepress/pagination': {},
    ],
    markdown: {
        // https://vuepress.vuejs.org/config/#markdown-linenumbers
        lineNumbers: true,
        // options for markdown-it-anchor
        anchor: {
            permalinkBefore: true,
            permalink: true,
            level: [
                // We don't want to include the top-level header, so remove level 1.
                // 1,
                2,
                3,
                4,
                5,
                6,
            ],
            // callback: (args) => {
            //     debug('markdown:anchor:callback args=', args);
            // },
            // format: (args) => {
            //     debug('markdown:anchor:format args=', args);
            // },
        },
        // options for markdown-it-toc
        toc: {
            includeLevel: [
                // We don't want to include the top-level header, so remove level 1.
                // 1,
                2,
                3,
                4,
                5,
                6,
            ],
            // If you want to debug this, e.g., to compare it again Confluence, uncomment line below
            // and the table of contents will be numbered (ol=ordered list) instead of being
            // un-numbered (ul=unordered list).
            // 'listType': 'ol',

            // callback: (args) => {
            //     debug('markdown:toc:callback args=', args);
            // },
            // format: (args) => {
            //     debug('markdown:toc:formatormat args=', args);
            // },
        },
        extendMarkdown: (md) => {
            debug_vuepress('markdown:extendMarkdown - md=', util.inspect(md, inspect_options));
            // use more markdown-it plugins!
            // Converts '\n' in paragraphs into <br>
            md.set({ breaks: true });
            md.use(require('markdown-it-katex'));
            md.use(require('markdown-it-footnote'));
            return md;
        },
        // https://vuepress.vuejs.org/plugin/option-api.html#chainmarkdown
        chainMarkdown: (config) => {
            debug_vuepress('markdown:extendMarkdown - config=', util.inspect(config, inspect_options));
            return config;
        },
    },
    // https://vuepress.vuejs.org/config/#cache
    cache: false,
    // https://vuepress.vuejs.org/config/#extrawatchfiles
    // extraWatchFiles: [
    //     '.vuepress/config.js',
    //     // '.vuepress/enhanceApp.js',
    //     // './docs/.vuepress/enhanceApp.js',
    //     // 'docs/.vuepress/enhanceApp.js',
    //     '.vuepress/config/**',
    //     'docs/.vuepress/config/*.js',
    //     './docs/.vuepress/config/*.js',
    //     // '**/*.pdf',
    //     // './resume/*.pdf',
    //     // './resume/**.pdf',
    //     // './resume/Mohamed_Bana-CV-LinkedIn.pdf',
    //     // './resume/Mohamed_Bana-CV-LinkedIn_Profile.pdf',
    // ],
    // https://cli.vuejs.org/config/#devserver
    // https://webpack.js.org/configuration/dev-server/
    //
    // These settings control the server that is started when you do `yarn serve`.
    devServer: {
        // string = 'info': 'silent' | 'trace' | 'debug' | 'info' | 'warn' | 'error' | 'none' | 'warning'
        clientLogLevel: 'info',
        // compress: true,
        // compress: false,
        // https://webpack.js.org/configuration/dev-server/#devserveroverlay
        overlay: {
            warnings: true,
            errors: true,
        },
        // quiet: true,
        // open: 'Google Chrome',// Mac
        open: 'google-chrome', // Linux
        // https://webpack.js.org/configuration/dev-server/#devserveropenpage
        // openPage: [
        //     // 'the-quran',
        //     // 'resume/about-me',
        //     // 'resume/cv',
        //     'resume',
        //     // '',
        // ],
        // https://webpack.js.org/configuration/dev-server/#devserverhistoryapifallback
        // historyApiFallback: true,
        // // https://webpack.js.org/configuration/dev-server/#devserverserveindex
        // serveIndex: true,
        // // https://webpack.js.org/configuration/dev-server/#devserverstats-
        // // string: 'none' | 'errors-only' | 'minimal' | 'normal' | 'verbose' object
        // stats: 'errors-only',
        // // https://webpack.js.org/configuration/dev-server/#devserverwatchcontentbase
        // watchContentBase: true,
        // // https://webpack.js.org/configuration/dev-server/#devserverwritetodisk-
        // writeToDisk: true,

        // https://webpack.js.org/configuration/output/#outputpath
        // doesn't work
        // pathinfo: true,
    },
    // https://cli.vuejs.org/config/#configurewebpack
    // https://vuepress.vuejs.org/config/#configurewebpack
    // https://cli.vuejs.org/guide/webpack.html#modifying-options-of-a-loader
    chainWebpack: (config, isServer) => {
        // config.module
        //     .rule('pdfs')
        //     .test(/\.(pdf)(\?.*)?$/)
        //     .use('file-loader')
        //     .loader('file-loader')
        //     .options({
        //         // debug('pdf - options=%O', options);
        //         // const optionsDefault = {
        //         //     name: `assets/pdf/[path][name].[ext]`,
        //         // };
        //         // const opts = { ...options, ...optionsDefault };
        //         // debug('pdf - opts=%O', opts);
        //         // return opts;
        //         name: `[path][name].[ext]`,
        //     })
        //     .end();

        copyStaticFilesToPublic();
        // debug('pdf - options=%s', config.toString());
    },
    // https://vuepress.vuejs.org/config/#evergreen
    // evergreen: true,
    // https://cli.vuejs.org/config/#chainwebpack
    // https://vuepress.vuejs.org/config/#chainwebpack
    configureWebpack: (config, isServer) => {
        // debug('configureWebpack - options=%s', config.toString());

        // debug('configureWebpack - isServer=%s, config.module=', isServer, config.module);

        // Inline fonts and images so we don't do another fetch for them.
        // If we set `limit` to zero, all the fonts and images are inlined.
        // Explanation can be found in:
        // * https://cli.vuejs.org/guide/webpack.html#replacing-loaders-of-a-rule
        // * https://github.com/vuejs/vue-cli/issues/3215
        // config.module.rule('fonts').use('url-loader').tap((opts) => {
        //     const options = Object.assign(opts, { limit: 0 });
        //     return options;
        // });

        // config.module.rule('images').use('url-loader').tap((opts) => {
        //     const options = Object.assign(opts, { limit: 0 });
        //     return options;
        // });

        // // https://github.com/vuejs/vuepress/issues/700#issuecomment-460550225
        // config.module
        //     .rule('pdfs')
        //     .test(/\.pdf$/)
        //     .use('file-loader')
        //     .loader('file-loader')
        //     .options({
        //         name: `[path][name].[ext]`
        //     });
    },
    // https://cli.vuejs.org/config/#runtimecompiler
    runtimeCompiler: true,
    // https://cli.vuejs.org/config/#productionsourcemap
    productionSourceMap: true,
    // https://cli.vuejs.org/config/#parallel
    parallel: 32,
    // https://cli.vuejs.org/config/#css-sourcemap
    css: {
        sourceMap: true,
    },
    // // https://vuepress.vuejs.org/config/#evergreen
    // // This will disable ES5 transpilation and polyfills for IE, and result in faster builds and smaller files.
    // // Set to true, if we want to support IE.
    // evergreen: true,
};
