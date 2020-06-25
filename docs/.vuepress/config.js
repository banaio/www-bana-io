// https://github.com/ycmjason/ycmjason.com/blob/master/.vuepress/config.js
module.exports = {
    // https://vuepress.vuejs.org/config/#basic-config
    title: 'BanaIO',
    // description: 'Just playing around'
    head: [
        [
            'link',
            {
                rel: 'icon',
                href: '/favicon.ico',
            }
        ],
        [
            'link',
            {
                rel: 'stylesheet',
                href: 'https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=latin-ext',
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
            {
                text: 'Blog',
                link: '/blog/'
            },
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
            //     ]
            // },
            {
                text: 'b@bana.io',
                link: 'mailto:b@bana.io'
            },
            {
                text: 'GitHub - mbana',
                link: 'https://github.com/mbana'
            },
            {
                text: 'GitHub - BanaIO',
                link: 'https://github.com/banaio'
            },
            // {
            //     text: 'Twitter',
            //     link: 'https://twitter.com/m_bana/'
            // },
            {
                text: 'LinkedIn',
                link: 'https://uk.linkedin.com/in/mbana'
            },
            {
                text: 'CV',
                link: '/cv/'
            },
        ],
        sidebar: 'auto',
        sidebarDepth: 0,
        displayAllHeaders: true,
        lastUpdated: 'Last Updated',
    },
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
        toc: { includeLevel: [1, 2] },
        extendMarkdown: md => {
            // use more markdown-it plugins!
            md.use(require('markdown-it-katex'));
            md.use(require('markdown-it-footnote'));
        },
    },
    shouldPrefetch: (file, type) => {
        console.log('shouldPrefetch, file=', file);
        console.log('shouldPrefetch, type=', type);
        return true;
    },
    cache: false,

    // https://cli.vuejs.org/config/#devserver
    // https://webpack.js.org/configuration/dev-server/
    //
    // These settings control the server that is started when you do `yarn serve`.
    devServer: {
        clientLogLevel: 'info',
        compress: true,
        overlay: {
            warnings: false,
            errors: true,
        },
        open: 'google-chrome',
        // open: 'Google Chrome',
    },

    // https://cli.vuejs.org/config/#configurewebpack
    // https://vuepress.vuejs.org/config/#configurewebpack
    chainWebpack: (config, isServer) => {
        console.log('chainWebpack, isServer=', isServer);
        // console.log('chainWebpack, config.module=', config.module);
    },

    // https://cli.vuejs.org/config/#chainwebpack
    // https://vuepress.vuejs.org/config/#chainwebpack
    configureWebpack: (config, isServer) => {
        console.log('configureWebpack, isServer=', isServer);
        // console.log('configureWebpack, config.module=', config.module);

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
    },

    // https://cli.vuejs.org/config/#css-sourcemap
    css: {
        sourceMap: true,
    },
};
