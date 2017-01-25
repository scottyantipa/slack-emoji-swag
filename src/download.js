const https = require('https');
const fs = require('fs');
const getEmojiList = require('./getEmojiList.js');

const imageExtension = (path) => {
  const extension = /[^./\\]*$/.exec(path)
  return extension ? extension[0] : undefined;
}

const fetchImages = (emojiJSON) => {
  Object.keys(emojiJSON).forEach((name) => {
    const url = emojiJSON[name];
    const extension = imageExtension(url);

    if (!extension) {
      console.log(`Could not get file extension from url ${url}, but I'ma keep on trucking...`)
      return;
    }

    try {
      https.get(url, function(response) {
        const fileName = `../generated/${name}.${extension}`;
        console.log(`Snuggling emoji up into ${fileName}`);
        file = fs.createWriteStream(fileName);
        response.pipe(file);
      });
    } catch (err) {
      console.log(`Failed to download image at ${url}, but I'ma keep on trucking...`, err);
    }
  });
}

const download = () => {
  getEmojiList(fetchImages);
}

module.exports = download;
