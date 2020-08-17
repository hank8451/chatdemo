import consumer from "./consumer"
import { Subscription } from "@rails/actioncable";

document.addEventListener('turbolinks:load', () => {
  
  const element = document.getElementById("channel_id");
  const channelId = element.getAttribute("data-channel-id");
  // const submitBtn = document.querySelector('#submit');
  // const messageInput = document.querySelector('#message');
  // console.log(element);
  // console.log(channelId);
  consumer.subscriptions.create({channel: "ChatroomChannel", chatroom_id: channelId}, {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log(`Web Socket server connecting! ${channelId}`)
      // console.log(this.received)
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      // console.log(data)
      const messageAdd = document.querySelector("#messagelist");
      const messageInput = document.querySelector("input");
      const newMessage = document.createElement("li");
      messageInput.value
      // newMessage.innerHTML = data.message
      messageAdd.insertAdjacentElement("beforeend", newMessage);
      // console.log(messageInput);

    }
  });
  
})

