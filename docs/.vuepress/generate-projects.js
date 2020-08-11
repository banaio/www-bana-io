#!/usr/bin/env node

// https://docs.github.com/en/rest/reference/projects#list-repository-projects
// https://developer.github.com/v3/repos/#list-organization-repositories
const { Octokit } = require("@octokit/core");

const { name, version } = require('../../package.json');

const util = require('util');
const inspect_options = { compact: false, depth: 1, breakLength: Infinity /*80*/, showHidden: true, colors: true, sorted: true, getters: true };

const LANGUAGE_FILTERS = ['Go', 'Rust'];

// console.log('LANGUAGE_FILTERS=%O', LANGUAGE_FILTERS);
// console.log('name=%O, version=%O', name, version);

const MyOctokit = Octokit.defaults(
    (options) => {
        // console.log('options=%O', options);
        return Object.assign({}, options, {
            // auth: "personal-access-token123",
            // baseUrl: "https://github.acme-inc.com/api/v3",
            // userAgent: "my-app/v1.2.3",
            'Pragma': 'no-cache',
            'cache-control': 'no-cache',
            'user-agent': `${name}/${version}`,
            'origin': 'https://bana.io',
        });
    }
);
const octokit = new MyOctokit({
    log: require("console-log-level")({
        prefix: (level) => {
            return [level, new Date().toISOString()].join(':');
        },
        level: 'trace',
        stderr: false,
    }),
    // log: {
    //     debug: console.debug.bind(console),
    //     info: require("console-log-level")({
    //         prefix: (level) => {
    //             return [level, new Date().toISOString()].join(':');
    //         },
    //         level: 'info',
    //     }),
    //     warn: console.warn.bind(console),
    //     error: require("console-log-level")({
    //         level: "error",
    //         prefix: (level) => {
    //             return [level, new Date().toISOString()].join(':');
    //         },
    //         //   level: 'info',
    //     }),
    // }
});

// octokit.hook.after("request", async (response, options) => {
//     octokit.log.trace(`${options.method} ${options.url}: ${response.status}`);
//     // octokit.log.trace(`${options.method} ${options.url}: ${response.status}`);
// });

// Following GitHub docs formatting:
// https://developer.github.com/v3/repos/#list-organization-repositories
const filtered = (async (mod) => {
    const result = await octokit.request("GET /orgs/:org/repos", {
        // headers: {
        //     //   authorization: "token 0000000000000000000000000000000000000001",
        //     'Pragma': 'no-cache',
        //     'cache-control': 'no-cache',
        //     'user-agent': `${name}/${version}`,
        //     // 'accept': 'application/vnd.github.v3+json',
        // },
        org: "banaio",
        type: "public",
        per_page: 100,
        sort: 'updated',
        direction: 'desc',
        accept: 'application/vnd.github.v3+json',
    });

    // console.log(`${result.data.length} repos found.`);
    const filtered = result.data.filter((repo) => {
        // const { html_url, language, description = '' } = repo;
        // console.log('initial - html_url=%O, language=%O, description=%O', html_url, language, description);
        return LANGUAGE_FILTERS.some((filter) => filter.match(repo.language));
        // if (repo.description !== null) {
        //     return true;
        // }
        // return false;
    }).map((repo) => {
        if (repo.description) {
            return repo;
        }
        return { ...repo, description: '' };
    }).map((repo) => {
        const { html_url, language, description, name } = repo;
        // console.log('intermediate - name=%O, html_url=%O, language=%O, description=%O', name, html_url, language, description);
        return {
            name: name.trim(),
            description: description.trim(),
            html_url,
            language,
        };
    });
    // console.log('filtered=%O', filtered);

    return [
        {
            text: 'Golang',
            link: '/golang/',
        },
        {
            text: 'Golang Projects',
            link: '/golang/projects',
            items: filtered.filter((repo) => {
                return repo.language === 'Go';
            }).map((repo) => {
                return {
                    text: repo.name,
                    link: repo.html_url,
                    description: repo.description,
                }
            }),
        },
        {
            text: 'Rust Lang',
            link: '/rust-lang/',
        },
        {
            text: 'Rust Lang Projects',
            link: '/rust-lang/projects',
            items: filtered.filter((repo) => {
                return repo.language === 'Rust';
            }).map((repo) => {
                return {
                    text: repo.name,
                    link: repo.html_url,
                    description: repo.description,
                }
            }),
        },
    ];

    console.log('filtered=%O', filtered);
    // console.log('filtered=%O', JSON.stringify(filtered));
    // console.log('filtered=%O', util.inspect(filtered, inspect_options));
})(module).then((filtered) => {
    console.log('filtered=%j', filtered);
    console.log('filtered=%o', filtered);
    console.log('filtered=%O', filtered);
    console.log('filtered=%s', filtered);
});

module.exports = filtered;


// # select(.language == "Rust") |
// # if (.description != null) then
// #   ("* **" + (.description | gsub("(^\\s+)|(\\s+$)";"")) + ":** [" + .html_url + "]" + "(" + .html_url + ")")
// # else
// #   ("* [" + .html_url + "]" + "(" + .html_url + ")")
// # end

// {
//     text: 'Rust Lang',
//     link: '/rust-lang/',
//     items: [
//         {
//             text: 'Rust Lang',
//             link: '/rust-lang/',
//         },
//         {
//             text: 'Rust Lang Projects',
//             link: '/rust-lang/projects',
//         },
//         {
//             text: 'Install',
//             link: '/rust-lang/install',
//         },
//     ]
// },
// {
//     text: 'Golang',
//     link: '/golang/',
//     items: [
//         {
//             text: 'Golang',
//             link: '/golang/',
//         },
//         {
//             text: 'Golang Projects',
//             link: '/golang/projects',
//             items: [
//                 {
//                     text: 'Golang Projects',
//                     link: '/golang/projects',
//                 },
//                 {
//                     text: 'openbankingforgerock',
//                     link: 'https://github.com/banaio/openbankingforgerock',
//                 },
//                 {
//                     text: 'go-gdax',
//                     link: 'https://github.com/banaio/go-gdax',
//                 },
//                 {
//                     text: 'go_gdax_fix',
//                     link: 'https://github.com/banaio/go_gdax_fix',
//                 },
//                 {
//                     text: 'go_samples',
//                     link: 'https://github.com/banaio/go_samples',
//                 },
//             ],
//         },
//     ]
// },

// export default ({ router }) => {
//     router.addRoutes([
//         // { path: '/cv/', redirect: '/resume/cv' },
//         // { path: '/cv', redirect: '/resume/cv' },
//         // { path: '/cv/*', redirect: '/resume/cv' },
//         { path: '/cv*', redirect: '/resume/cv' },
//     ]);
// };
