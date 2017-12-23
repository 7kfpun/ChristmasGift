import React, { Component } from 'react';
import {
  Platform,
  Text,
  View,
} from 'react-native';
import { GiftedChat } from 'react-native-gifted-chat';
import { gif, joke, joke2 } from './utils';
import he from 'he';

const firstName = '';
const lastName = '非邊緣人';

const user = {
  _id: 2,
  name: `${firstName} ${lastName}`,
  avatar: require('./asset/profile.jpg'),
};

export default class Chat extends React.Component {
  state = {
    messages: [],
  };

  componentWillMount() {
    this.setState({
      messages: [
        {
          _id: 1,
          text: `Hi ${firstName} ${lastName}`,
          createdAt: new Date(),
          user,
        },
      ],
    });
  }

  delayResponse(messages) {
    const that = this;
    setTimeout(function() {
      if (Math.random() < 0.5 || messages[0].text.toLowerCase().indexOf('joke') !== -1) {
        if (Math.random() < 0.5) {
          that.getJoke();
        } else {
          that.getJoke2();
        }
      } else {
        that.getGif(messages[0].text);
      }
    }, Math.random() * 5 * 1000);
  }

  getJoke() {
    const that = this;
    joke(firstName, lastName).then((json) => {
      if (json && json.type && json.type === 'success' && json.value && json.value.joke)
        that.setState((previousState) => ({
          messages: GiftedChat.append(previousState.messages, [{
            _id: Math.round(Math.random() * 1000000),
            text: he.decode(json.value.joke),
            createdAt: new Date(),
            user
          }]),
        }));
    });
  }

  getGif(text) {
    const that = this;
    gif(text).then((json) => {
      if (json && json.results && json.results.length > 0) {
        const array = json.results;
        const rand = array[Math.floor(Math.random() * array.length)];
        console.log(rand);

        that.setState((previousState) => ({
          messages: GiftedChat.append(previousState.messages, [{
            _id: Math.round(Math.random() * 1000000),
            createdAt: new Date(),
            image: rand.media[0].gif.url,
            imageProps: {
              resizeMode: 'contain',
            },
            user
          }]),
        }));
      }
    });
  }

  getJoke2() {
    const that = this;
    joke2().then((json) => {
      if (json && json.joke) {
        that.setState((previousState) => ({
          messages: GiftedChat.append(previousState.messages, [{
            _id: Math.round(Math.random() * 1000000),
            createdAt: new Date(),
            text: he.decode(json.joke),
            createdAt: new Date(),
            user
          }]),
        }));
      }
    });
  }

  onSend(messages = []) {
    console.log('messages', messages);
    this.setState((previousState) => ({
      messages: GiftedChat.append(previousState.messages, messages),
    }));

    this.delayResponse(messages);
  }

  render() {
    return (
      <GiftedChat
        messages={this.state.messages}
        onSend={(messages) => this.onSend(messages)}
        user={{
          _id: 1,
        }}
      />
    );
  }

}
