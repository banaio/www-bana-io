---
title: "Blog"
tags: ["blog"]
sidebar: false
---

<router-link v-for="post in posts" v-bind:key="post.path" :to="post.path" tag="div"><h2><a>{{ post.title }}</a></h2><div>{{ post.frontmatter.date }}, <b class="tags-heading">Tags:</b> <span v-for="(item, index) in post.frontmatter.tags" class="tag">{{ item }}</span></div><div></div>
</router-link>

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
        posts() {
            const sorted_desc = this.$site.pages.filter((page) => {
                // console.log('page.path=', page.path);
                // console.log('page.path=', page.path);
                return page.path.startsWith("/blog/");
            }).filter((page) => {
                return page.frontmatter.type === 'post';
            }).sort((a,b) => {
                return new Date(b.frontmatter.date) - new Date(a.frontmatter.date);
            }).map((page) => {
                const formatted_date = new Date(page.frontmatter.date).toLocaleDateString(LOCALE, LOCALE_OPTIONS)
                page.frontmatter.date = formatted_date;
                // page.frontmatter.date = this.format_date(page.frontmatter.date);
                return page;
            })

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
