// https://github.com/ycmjason/ycmjason.com/blob/master/.vuepress/config.js
module.exports = {
    // https://vuepress.vuejs.org/config/#basic-config
    title: 'BanaIO',
    description: 'Mohamed Bana—The Builder',
    head: [
        [
            'link',
            {
                rel: 'icon',
                href: '/favicon.ico',
            }
        ],
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
            // {
            //     text: 'The Quran',
            //     link: '/the-quran/',
            // },
        ],
        sidebar: 'auto',
        sidebarDepth: 0,
        displayAllHeaders: true,
        lastUpdated: 'Last Updated',
        smoothScroll: true,
        // serviceWorker: {
        //     updatePopup: {
        //         message: "New content is available.",
        //         buttonText: "Refresh"
        //     }
        // },
    },
    // serviceWorker: true,
    // permalink: ':slug',
    // plugins: {
    //     '@vuepress/blog': {
    //         postsDir: 'blog',
    //         permalink: ':regular',
    //     },
    //     '@vuepress/pagination': {},
    // },
    markdown: {
        lineNumbers: true,
        // options for markdown-it-toc
        toc: { includeLevel: [1, 2, 3] },
        extendMarkdown: md => {
            // use more markdown-it plugins!
            md.use(require('markdown-it-katex'));
            md.use(require('markdown-it-footnote'));
        },
    },
    // cache: false,
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
        //         // console.error('pdf - options=%O', options);
        //         // const optionsDefault = {
        //         //     name: `assets/pdf/[path][name].[ext]`,
        //         // };
        //         // const opts = { ...options, ...optionsDefault };
        //         // console.error('pdf - opts=%O', opts);
        //         // return opts;
        //         name: `[path][name].[ext]`,
        //     })
        //     .end();

        copyStaticFilesToPublic();
        // console.error('pdf - options=%s', config.toString());
    },
    // https://vuepress.vuejs.org/config/#evergreen
    // evergreen: true,
    // https://cli.vuejs.org/config/#chainwebpack
    // https://vuepress.vuejs.org/config/#chainwebpack
    configureWebpack: (config, isServer) => {
        // console.error('configureWebpack - options=%s', config.toString());

        // console.log('configureWebpack - isServer=%s, config.module=', isServer, config.module);

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
};

const fs = require('fs');
const path = require('path');
const util = require('util');

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
    // console.error('copyStaticFilesToPublic - copyFileNames=%O', copyFileNames);
    // console.error('copyStaticFilesToPublic - doNotCopyFolderNames=%O', doNotCopyFolderNames);

    const pathToPublicFolder = path.resolve(__dirname, "public");
    const pathToSrcFolder = path.resolve(__dirname, "../");
    // console.error('copyStaticFilesToPublic - pathToPublicFolder=%o', pathToPublicFolder);
    // console.error('copyStaticFilesToPublic - pathToSrcFolder=%o', pathToSrcFolder);

    // if (fs.existsSync(pathToPublicFolder)) {
    //     fs.rmdirSync(pathToPublicFolder, { recursive: true }); // Requires latest version of node.
    // }

    const copyAllStaticFiles = (pathToSourceFolder, pathToDestinationFolder) => {
        // console.error('copyAllStaticFiles - pathToSourceFolder=%O', pathToSrcFolder);
        // console.error('copyAllStaticFiles - pathToDestinationFolder=%O', pathToDestinationFolder);

        if (!fs.existsSync(pathToDestinationFolder)) {
            console.error('copyAllStaticFiles - !fs.existsSync(pathToDestinationFolder) - CREATING pathToDestinationFolder=%o', pathToDestinationFolder);
            fs.mkdirSync(pathToDestinationFolder);
        } else {
            console.error('copyAllStaticFiles - fs.existsSync(pathToDestinationFolder) - SKIPPING pathToDestinationFolder=%O', pathToDestinationFolder);
        }

        const names = fs.readdirSync(
            pathToSourceFolder
        );
        // console.error('copyAllStaticFiles - readdirSync names=%O', names);

        for (const name of names) {
            const pathToSource = path.resolve(
                pathToSourceFolder,
                name
            );
            const pathToDestination = path.resolve(
                pathToDestinationFolder,
                name
            );
            console.error('copyAllStaticFiles - resolve name=%O', name);
            console.error('copyAllStaticFiles - resolve pathToSource=%O', pathToSource);
            console.error('copyAllStaticFiles - resolve pathToDestination=%O', pathToDestination);

            if (fs.lstatSync(pathToSource).isDirectory()) {
                if (doNotCopyFolderNames.some(regexp => regexp.test(name))) {
                    console.error('copyAllStaticFiles - fs.lstatSync(pathToSource).isDirectory() - SKIPPING doNotCopyFolderNames name=%O', name);
                } else {
                    const isEmptyDir = fs.readdirSync(pathToSource).length === 0;
                    if (!isEmptyDir) {
                        console.error('copyAllStaticFiles - fs.lstatSync(pathToSource).isDirectory() - !isEmptyDir - RECURSE doNotCopyFolderNames name=%o', name);
                        copyAllStaticFiles(pathToSource, pathToDestination);
                    } else {
                        console.error('copyAllStaticFiles - fs.lstatSync(pathToSource).isDirectory() - isEmptyDir - RECURSE doNotCopyFolderNames name=%o', name);
                    }
                }
            } else {
                if (copyFileNames.some(regexp => regexp.test(name))) {
                    console.error('copyAllStaticFiles - copyFileNames.some(regexp => regexp.test(name)) - CREATE copyFileNames name=%o', name);
                    fs.copyFileSync(pathToSource, pathToDestination);
                } else {
                    console.error('copyAllStaticFiles - copyFileNames.some(regexp => regexp.test(name)) - SKIPPING copyFileNames name=%O', name);
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
    // console.error('----------------------------------------');
    // console.error(util.formatWithOptions({
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
    // }, 'copyAllStaticFiles - FINISHED publicTree=%O', publicTree));
    // console.error('----------------------------------------');
};
