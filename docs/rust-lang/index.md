---
title: "Rust Lang"
tags: ["blog", "programming", "software", "rust", "rust lang"]
date: "2020-08-01"
sidebar: false
type: post
prev: false
next: ./projects
---

## Pages

* [Projects](./projects)
* [Install](./install)

<ul id="cv-download">
  <li v-for="(item, index) in downloads">
    {{ index }} - {{ item }}
  </li>
</ul>

<script>
// const LOCALE = 'en-US';
const LOCALE = 'en-GB';
const LOCALE_OPTIONS  = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

export default {
    methods: {
        format_date(date) {
            return new Date(date).toLocaleDateString(LOCALE, LOCALE_OPTIONS);
        }
    },
    computed: {
        downloads() {
            console.log('this.$site=%O', this.$site);
            console.log('this.$site.pages=%O', this.$site.pages);
            return this.$site;

            // const sorted_desc = this.$site.pages.filter((page) => {
            //     console.log('page=%O', page);
            //     console.log('page.path=%O', page.path);
            //     // console.log('page.path=', page.path);
            //     return page.path.startsWith("/blog/");
            // }).filter((page) => {
            //     console.log('page.frontmatter.type=%O', frontmatter.type);
            //     return page.frontmatter.type === 'post';
            // }).sort((a,b) => {
            //     return new Date(b.frontmatter.date) - new Date(a.frontmatter.date);
            // });
            // console.log('sorted_desc=%O', sorted_desc);
            // return sorted_desc;
        }
    },
}
</script>
