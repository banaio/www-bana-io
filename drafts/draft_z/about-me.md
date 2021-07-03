---
title: "About Me"
tags: ["resume", "about me"]
sidebar: false
prev: ./cover-letter
next: /resume/
draft: true
---

<!-- ![me.jpeg](./me.jpeg) -->

<!-- <div class="photo-container">
    <img class="photo" src="./me.jpeg">
</div> -->

<!-- https://web.dev/serve-images-webp/#serve-webp-images -->
<picture class="photo-container">
  <source type="image/webp" srcset="/me.webp">
  <source type="image/jpeg" srcset="/me.jpeg">
  <img src="/me.jpeg" alt="">
</picture>

My name is Mohamed Bana and I am mainly interested in the following areas:

* Web technologies.
* Containers and isolation techniques.
* Concurrency and distributed algorithms.

Resume and more:

* <https://linkedin.com/in/mbana>
* <https://github.com/banaio>
* <https://twitter.com/m_bana>

<style scoped>
.photo-container {
    /* border: 1px solid black; */
}

.photo-container > .photo {
    border: 1px solid black;
    display: block;
    margin: 0 auto;

    height: 45%;
    width: 45%;
}
</style>
