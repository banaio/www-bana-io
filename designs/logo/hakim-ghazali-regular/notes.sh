# https://www.linotype.com/184182/hakim-ghazali-regular-product.html

# $$('#tab1 > div > div > div > img').map(x => x.src).map(x => x.replace("fg=000000", "fg=E53935")).map(x => "wget -O '" + x.match(/.*(rs=.*?)(&.*)/i)[1].replace("=", "_") + ".png' '" + x.replace("&bg=ffffff", "") + "'").join("\n")
