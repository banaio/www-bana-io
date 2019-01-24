---
title: "Curriculum Vitae Download"
tags: ["resume", "cv", "cover letter"]
sidebar: false
prev: ./cv
next: ./cover-letter
---

## PDFs

* [`mohamed-bana_cv.pdf`](./download/mohamed-bana_cv.pdf)
* [`mohamed-bana_cover-letter.pdf`](./download/mohamed-bana_cover-letter.pdf)
* [`mohamed-bana_cv_cover-letter.pdf`](./download/mohamed-bana_cv_cover-letter.pdf)

<!-- ## ODT (OpenDocument Text, readable by OpenOffice)

* [`mohamed-bana_cv.odt`](./download/mohamed-bana_cv.odt)
* [`mohamed-bana_cover-letter.odt`](./download/mohamed-bana_cover-letter.odt)

## OpenDocument XML

* [`mohamed-bana_cv.xml`](./download/mohamed-bana_cv.xml)
* [`mohamed-bana_cover-letter.xml`](./download/mohamed-bana_cover-letter.xml)

## MS Word docx

* [`mohamed-bana_cv.docx`](./download/mohamed-bana_cv.docx)
* [`mohamed-bana_cover-letter.docx`](./download/mohamed-bana_cover-letter.docx) -->

## Pages

* [CV](./cv)
* [Cover Letter](./cover-letter)
* [About Me](./about-me)

<!-- ---

## Old

* [`Mohamed_Bana-CV-LinkedIn.pdf`](./download/Mohamed_Bana-CV-LinkedIn.pdf)
* [`Mohamed_Bana-CV-LinkedIn_Profile.pdf`](./download/Mohamed_Bana-CV-LinkedIn_Profile.pdf)

--- -->

<!-- <router-link
    v-for="download in downloads"
    v-bind:key="post.path"
    :to="post.path"
    tag="div"><h2><a>{{ post.title }}</a></h2><div class="date">{{ format_date(post.frontmatter.date) }}</div>
</router-link> -->

<!-- <ul id="cv-download">
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
</script> -->
