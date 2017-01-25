var https = require('https');

const token         = process.env['SLACK_API_TOKEN']
const emojiEndPoint = 'https://slack.com/api/emoji.list';
const url           = `${emojiEndPoint}?token=${token}`;

const getEmojiList = (callback) => {
  let body = '';

  https.get(url, (response) => {
    response.on('data', (chunk) => {
      body += chunk;
    });

    response.on('end', () => {
      callback(JSON.parse(body).emoji);
    })

  });
};

module.exports = getEmojiList;
