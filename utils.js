const joke = (firstName, lastName) => {
  const URL = `https://api.icndb.com/jokes/random?firstName=${firstName}&lastName=${lastName}&exclude=[nerdy,explicit]`;
  return fetch(URL)
    .then(res => res.json())
    .catch((err) => {
      console.log('Request for joke failed', err);
    });
};

const joke2 = () => {
  const URL = 'https://icanhazdadjoke.com';
  return fetch(URL, {
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    }
  })
    .then(res => res.json())
    .catch((err) => {
      console.log('Request for joke2 failed', err);
    });
};

const gif = (text) => {
  const URL = `https://api.tenor.com/v1/search?q=${text}&safesearch=moderate&key=Q7QQ5247UWA5`
  return fetch(URL)
    .then(res => res.json())
    .catch((err) => {
      console.log('Request for gif failed', err);
    });
};

exports.joke = joke;
exports.joke2 = joke2;
exports.gif = gif;
