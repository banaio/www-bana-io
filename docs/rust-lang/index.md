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

<router-link
    v-for="page in pages"
    v-bind:key="page.path"
    :to="page.path"
    tag="div"><h2><a>{{ page.title }}</a></h2><div>{{ page.lastUpdated }}, <b class="tags-heading">Tags:</b> <span v-for="(item, index) in page.frontmatter.tags" class="tag"><span v-if="index != 0">, </span>{{ item }}</span></div><div></div>
</router-link>

<script>
const LOCALE = 'en-GB';
const LOCALE_OPTIONS  = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

const format_date = (date) => {
    return new Date(date).toLocaleDateString(LOCALE, LOCALE_OPTIONS);
}

export default {
    computed: {
        pages() {
            // { "title": "Rust Lang", "frontmatter": { "title": "Rust Lang", "tags": [ "blog", "programming", "software", "rust", "rust lang" ], "date": "2020-08-01", "sidebar": false, "type": "post", "prev": false, "next": "./projects" }, "regularPath": "/rust-lang/", "relativePath": "rust-lang/index.md", "key": "v-32333916", "path": "/rust-lang/", "headers": [ { "level": 2, "title": "Pages", "slug": "pages" } ], "lastUpdated": "8/11/2020, 3:24:34 PM" }
            const { regularPath, relativePath, path } = this.$page;
            // const current_path =
            // console.log('this.$page=%O', this.$page);
            // console.log('this.$page=%o', this.$page);
            // console.log('this.$page=%j', this.$page);
            const sorted_desc = this.$site.pages.filter((page) => {
                // console.log('page=%O', page);
                // console.log('page=%o', page);
                // console.log('page=%j', page);
                const { path } = page;
                if (page.path && page.path === regularPath) {
                    return false;
                }
                if (page.path && page.path.startsWith(regularPath)) {
                    return true;
                }
                return false;
                // console.log('page.path=', page.path);
                // return page.path.startsWith(regularPath);
            }).sort((a,b) => {
                return new Date(b.lastUpdated) - new Date(a.lastUpdated);
            }).map((page) => {
                const formatted_date = format_date(page.lastUpdated);
                page.lastUpdated = formatted_date;

                return page;
            });

            // console.log('sorted_desc=', sorted_desc);
            return sorted_desc;
        }
    },
}
</script>

<style scoped>
.tags-heading {
    font-family: 'Alegreya Sans SC', sans-serif;
}
.tags {
    font-family: 'Alegreya Sans SC', sans-serif;
}

.tag {
    font-family: 'Alegreya Sans SC', sans-serif;
}
</style>
