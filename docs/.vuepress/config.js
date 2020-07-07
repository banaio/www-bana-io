const nav = require('./config/nav');
const head = require('./config/head');
const markdown = require('./config/markdown');
const devServer = require('./config/devserver');

// https://github.com/ycmjason/ycmjason.com/blob/master/.vuepress/config.js
module.exports = {
    // https://vuepress.vuejs.org/config/#basic-config
    title: 'BanaIO',
    // description: 'Just playing around'
    head,
    themeConfig: {
        logo: 'favicon.png',
        nav,
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
    markdown,
    cache: false,
    // https://vuepress.vuejs.org/config/#extrawatchfiles
    extraWatchFiles: [
        '.vuepress/config.js',
        '.vuepress/enhanceApp.js',
        './docs/.vuepress/enhanceApp.js',
        'docs/.vuepress/enhanceApp.js',
        '.vuepress/config/**',
        'docs/.vuepress/config/*.js',
        './docs/.vuepress/config/*.js',
        // '**/*.pdf',
        // './resume/*.pdf',
        // './resume/**.pdf',
        // './resume/Mohamed_Bana-CV-LinkedIn.pdf',
        // './resume/Mohamed_Bana-CV-LinkedIn_Profile.pdf',
    ],
    devServer,
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
        new RegExp(/^.*(?<!\.(md|png|jpe?g|gif|webp|svg|mp4|webm|ogg|mp3|wav|flac|aac|woff2?|eot|ttf|otf))$/i),
    ];
    const doNotCopyFolderNames = [
        new RegExp(/^.*\.vuepress$/),
        new RegExp(/^.*\.cache$/),
        new RegExp(/^.*\.temp$/),
    ];
    console.error('copyStaticFilesToPublic - copyFileNames=%O', copyFileNames);
    console.error('copyStaticFilesToPublic - doNotCopyFolderNames=%O', doNotCopyFolderNames);

    const pathToPublicFolder = path.resolve(__dirname, "public");
    const pathToSrcFolder = path.resolve(__dirname, "../");
    console.error('copyStaticFilesToPublic - pathToPublicFolder=%o', pathToPublicFolder);
    console.error('copyStaticFilesToPublic - pathToSrcFolder=%o', pathToSrcFolder);

    // if (fs.existsSync(pathToPublicFolder)) {
    //     fs.rmdirSync(pathToPublicFolder, { recursive: true }); // Requires latest version of node.
    // }

    const copyAllStaticFiles = (pathToSourceFolder, pathToDestinationFolder) => {
        // console.error('copyAllStaticFiles - pathToSourceFolder=%O', pathToSrcFolder);
        // console.error('copyAllStaticFiles - pathToDestinationFolder=%O', pathToDestinationFolder);

        if (!fs.existsSync(pathToDestinationFolder)) {
            // console.error('copyAllStaticFiles - CREATING pathToDestinationFolder=%o', pathToDestinationFolder);
            fs.mkdirSync(pathToDestinationFolder);
        } else {
            // console.error('copyAllStaticFiles - SKIPPING pathToDestinationFolder=%O', pathToDestinationFolder);
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
            // console.error('copyAllStaticFiles - resolve name=%O', name);
            // console.error('copyAllStaticFiles - resolve pathToSource=%O', pathToSource);
            // console.error('copyAllStaticFiles - resolve pathToDestination=%O', pathToDestination);

            if (fs.lstatSync(pathToSource).isDirectory()) {
                if (doNotCopyFolderNames.some(regexp => regexp.test(name))) {
                    // console.error('copyAllStaticFiles - SKIPPING doNotCopyFolderNames name=%O', name);
                } else {
                    // console.error('copyAllStaticFiles - RECURSE doNotCopyFolderNames name=%o', name);
                    copyAllStaticFiles(pathToSource, pathToDestination);
                }
            } else {
                if (copyFileNames.some(regexp => regexp.test(name))) {
                    // console.error('copyAllStaticFiles - CREATE copyFileNames name=%o', name);
                    fs.copyFileSync(pathToSource, pathToDestination);
                } else {
                    // console.error('copyAllStaticFiles - SKIPPING copyFileNames name=%O', name);
                }

                // old
                // if (!doNotCopyFilenames.some(regexp => regexp.test(name))) {
                //     fs.copyFileSync(pathToSource, pathToDestination);
                // }
            }
        }
    };

    copyAllStaticFiles(pathToSrcFolder, pathToPublicFolder);
    const publicTree = allFilesSync(pathToPublicFolder);
    console.error('----------------------------------------');
    console.error(util.formatWithOptions({
        getters: true,
        showHidden: true,
        depth: Infinity,
        colors: true,
        customInspect: true,
        showProxy: true,
        maxArrayLength: Infinity,
        maxStringLength: null,
        breakLength: Infinity,
        compact: false,
        sorted: false,
    }, 'copyAllStaticFiles - FINISHED publicTree=%O', publicTree));
    console.error('----------------------------------------');
};
