#!/usr/bin/env node

// https://docs.github.com/en/rest/reference/projects#list-repository-projects
// https://developer.github.com/v3/repos/#list-organization-repositories
const { Octokit } = require('@octokit/core')
const { name, version } = require('../../package.json')

// const util = require('util')
// const inspect_options = {
//   compact: false,
//   depth: 1,
//   breakLength: Infinity /* 80 */,
//   showHidden: true,
//   colors: true,
//   sorted: true,
//   getters: true
// }

const LANGUAGE_FILTERS = ['Go', 'Rust']

// console.log('LANGUAGE_FILTERS=%O', LANGUAGE_FILTERS);
// console.log('name=%O, version=%O', name, version);

const MyOctokit = Octokit.defaults((options) => {
  return Object.assign({}, options, {
    Pragma: 'no-cache',
    'cache-control': 'no-cache',
    'user-agent': `${name}/${version}`,
    origin: 'https://bana.io',
  })
})
const octokit = new MyOctokit({
  log: require('console-log-level')({
    prefix: (level) => {
      return [level, new Date().toISOString()].join(':')
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
})
// Following GitHub docs formatting:
// https://developer.github.com/v3/repos/#list-organization-repositories
const filtered = (async (mod) => {
  const result = await octokit.request('GET /orgs/:org/repos', {
    org: 'banaio',
    type: 'public',
    per_page: 100,
    sort: 'updated',
    direction: 'desc',
    accept: 'application/vnd.github.v3+json',
  })

  // console.log(`${result.data.length} repos found.`);
  const filtered = result.data
    .filter((repo) => {
      // const { html_url, language, description = '' } = repo;
      // console.log('initial - html_url=%O, language=%O, description=%O', html_url, language, description);
      return LANGUAGE_FILTERS.some((filter) => filter.match(repo.language))
      // if (repo.description !== null) {
      //     return true;
      // }
      // return false;
    })
    .map((repo) => {
      if (repo.description) {
        return repo
      }
      return { ...repo, description: '' }
    })
    .map((repo) => {
      const { html_url, language, description, name } = repo
      return {
        name: name.trim(),
        description: description.trim(),
        html_url,
        language,
      }
    })

  return [
    {
      text: 'Golang',
      link: '/golang/',
    },
    {
      text: 'Golang Projects',
      link: '/golang/projects',
      items: filtered
        .filter((repo) => {
          return repo.language === 'Go'
        })
        .map((repo) => {
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
      items: filtered
        .filter((repo) => {
          return repo.language === 'Rust'
        })
        .map((repo) => {
          return {
            text: repo.name,
            link: repo.html_url,
            description: repo.description,
          }
        }),
    },
  ]
})(module).then((filtered) => {
  console.log('filtered=%j', filtered)
  console.log('filtered=%o', filtered)
  console.log('filtered=%O', filtered)
  console.log('filtered=%s', filtered)
})

module.exports = filtered
