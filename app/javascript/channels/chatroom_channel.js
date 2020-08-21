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
      // console.log(data.message)
      const msgBox = document.querySelector("#messagelist")
      const newMsg = document.createElement("li")
      newMsg.innerHTML = data.message
      // console.log(newMsg)
      msgBox.insertAdjacentElement("afterbegin", newMsg)
      document.forms[0].reset()
      // clearup()
      // const submit = document.querySelector("input[type='submit']")
      
      // console.log(document.forms[0])
    }
  });

})

