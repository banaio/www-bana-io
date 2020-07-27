// https://cli.vuejs.org/config/#devserver
// https://webpack.js.org/configuration/dev-server/
//
// These settings control the server that is started when you do `yarn serve`.
module.exports = {
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
    // https://webpack.js.org/configuration/dev-server/#devserverserveindex
    serveIndex: true,
    // https://webpack.js.org/configuration/dev-server/#devserverstats-
    // string: 'none' | 'errors-only' | 'minimal' | 'normal' | 'verbose' object
    stats: 'errors-only',
    // // https://webpack.js.org/configuration/dev-server/#devserverwatchcontentbase
    // watchContentBase: true,
    // // https://webpack.js.org/configuration/dev-server/#devserverwritetodisk-
    // writeToDisk: true,

    // https://webpack.js.org/configuration/output/#outputpath
    // doesn't work
    // pathinfo: true,
};