#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail
# set -x

# sudo apt-get install webp

# docs/logo

dir_name="converted"

echo 'ORIGINAL'
echo "----"
ls --recursive
echo "----"
echo

# rm -rv "${dir_name}" || true
# mkdir -v "${dir_name}"
if [[ -d "${dir_name}" ]]; then
  echo "REMOVING: '${dir_name}', contents: '$(echo $(ls ${dir_name}))'"
  rm -rfv "${dir_name}/*"
  # rm -rfv "${dir_name}/*"
else
  echo "CREATING: '${dir_name}'"
  mkdir -v "${dir_name}"
fi

echo 'PRUNED'
echo "----"
ls --recursive
echo "----"

echo 'START'
echo "----"

mogrify -format jpeg -path "${dir_name}" logo.svg
mogrify -format jpg -path "${dir_name}" logo.svg

echo "----"
ls --recursive
echo "----"

convert logo.svg -background transparent \
  -alpha off -resize 256x256 \
  -define icon:auto-resize="256,128,96,64,48,32,16" \
  "${dir_name}"/favicon.ico

# mogrify -format ico -background transparent \
#   \( -clone 0 -resize 16x16 -extent 16x16 \) \
#   \( -clone 0 -resize 32x32 -extent 32x32 \) \
#   \( -clone 0 -resize 48x48 -extent 48x48 \) \
#   \( -clone 0 -resize 64x64 -extent 64x64 \) \
#   -delete 0 -alpha off -colors 256 -path converted logo.svg

echo "----"
ls --recursive
echo "----"

echo 'DONE'

# convert -resize x16 -gravity center -crop 16x16+0+0 logo.svg -flatten -colors 256 -background transparent favicon.ico

# # mogrify logo.svg -resize 16x16 -density 16x16 -background transparent favicon.ico
#   convert image.png  -background white \
#           \( -clone 0 -resize 16x16 -extent 16x16 \) \
#           \( -clone 0 -resize 32x32 -extent 32x32 \) \
#           \( -clone 0 -resize 48x48 -extent 48x48 \) \
#           \( -clone 0 -resize 64x64 -extent 64x64 \) \
#           -delete 0 -alpha off -colors 256 favicon.ico

# convert image.png  -bordercolor white -border 0 \
#           \( -clone 0 -resize 16x16 \) \
#           \( -clone 0 -resize 32x32 \) \
#           \( -clone 0 -resize 48x48 \) \
#           \( -clone 0 -resize 64x64 \) \
#           -delete 0 -alpha off -colors 256 favicon.ico

# http://www.imagemagick.org/Usage/thumbnails/#favicon
# FavIcon Web Page Link Thumbnail
# The "favion.ico" icon often looked for by web browsers on the top level web page of a web site, for that whole site. That image is a special multi-resolution image format and can be created as follows.

#   convert image.png -alpha off -resize 256x256 \
#           -define icon:auto-resize="256,128,96,64,48,32,16" \
#           favicon.ico
# The 'image.png' can be anything you like, but should be square. If it isn't that should also be the first step in the above.
# You can also include larger resolutions such as 128 or 256 pixels, but few browsers would make use of them. The 16 and 32 pixel sizes are much more commonly used in such ICO files so special emphesis on those my be useful. Also remember that many browsers will color reduce the images so are to reduce the space used to store it in an users bookmarks file.
# This brings us to one other point. As only the smallest of images are typically used, with further color reduction, it is recommented to keep the images as small and as well defined as posible.
# Here is an example of manually resizing images for an ICO file format.

#   convert image.png  -background white \
#           \( -clone 0 -resize 16x16 -extent 16x16 \) \
#           \( -clone 0 -resize 32x32 -extent 32x32 \) \
#           \( -clone 0 -resize 48x48 -extent 48x48 \) \
#           \( -clone 0 -resize 64x64 -extent 64x64 \) \
#           -delete 0 -alpha off -colors 256 favicon.ico

# As mentioned only the "favion.ico" image found on the top level directory of a web site is generally used, however you can also specify the location of the link thumbnail image by adding the following HTML tag to the headers of your pages...

#   <LINK REL="icon" HREF="/path/to/favicon.ico" type="image/x-icon">
#   <LINK REL="shortcut" HREF="/path/to/favicon.ico" type="image/x-icon">
