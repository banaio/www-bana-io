// https://vuepress.vuejs.org/guide/basic-config.html#app-level-enhancements

export default ({
    Vue, // the version of Vue being used in the VuePress app
    options, // the options for the root Vue instance
    router, // the router instance for the app
    siteData, // site metadata
    isServer // is this enhancement applied in server-rendering or client
}) => {
    // ...apply enhancements to the app
    router.addRoutes([
        // { path: '/cv/', redirect: '/resume/cv' },
        // { path: '/cv', redirect: '/resume/cv' },
        // { path: '/cv/*', redirect: '/resume/cv' },
        { path: '/cv*', redirect: '/resume/cv' },
    ]);
}
