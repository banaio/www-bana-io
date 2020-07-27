module.exports = {
    lineNumbers: true,
    // options for markdown-it-toc
    toc: { includeLevel: [1, 2, 3] },
    extendMarkdown: md => {
        // use more markdown-it plugins!
        md.use(require('markdown-it-katex'));
        md.use(require('markdown-it-footnote'));
    },
};