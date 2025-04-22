<%@ page contentType="text/html; charset=UTF-8" %>
<!-- 💬 Иконка чата -->
<div id="chatIcon" onclick="toggleChat()">💬</div>

<!-- 🪟 Окно чата -->
<div id="chatContainer" style="display: none;">
  <div id="chatWindow"></div>
  <div id="inputArea">
    <textarea id="userInput" placeholder="Введите сообщение..."></textarea>
    <button onclick="sendMessage()">➤</button>
    <button onclick="clearChat()" style="background:#dc3545;">Сброс</button>
  </div>
</div>

<style>
  #chatIcon {
    position: fixed; bottom: 30px; right: 30px;
    width: 60px; height: 60px;
    background: #007bff; color: white;
    border-radius: 50%; text-align: center;
    font-size: 28px; line-height: 60px;
    cursor: pointer; z-index: 999;
  }

  #chatContainer {
    position: fixed; bottom: 100px; right: 30px;
    width: 350px; height: 500px;
    background: white; border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    display: flex; flex-direction: column;
    overflow: hidden; z-index: 998;
  }

  #chatWindow {
    flex: 1; padding: 10px;
    overflow-y: auto; background: #f5f5f5;
  }

  .message {
    padding: 8px 12px; margin: 8px 0;
    border-radius: 10px; max-width: 80%;
  }

  .user {
    background: #daf1ff; margin-left: auto;
    text-align: right;
  }

  .assistant {
    background: #e4e4e4; margin-right: auto;
    text-align: left;
  }

  #inputArea {
    display: flex; padding: 10px;
    border-top: 1px solid #ccc;
  }

  #userInput {
    flex: 1; padding: 8px;
    border-radius: 8px; border: 1px solid #ccc;
    resize: none;
  }

  button {
    margin-left: 5px;
    padding: 8px 12px;
    border-radius: 8px;
    background: #007bff; color: white;
    border: none; cursor: pointer;
  }
</style>

<script>
  const chatContainer = document.getElementById("chatContainer");
  const chatWindow = document.getElementById("chatWindow");
  const userInput = document.getElementById("userInput");

  let messages = [
    {
      role: "system",
      content: "Ты дружелюбный AI-ассистент. Помни контекст диалога и пиши вежливо. Добавляй эмодзи, если уместно."
    }
  ];

  function toggleChat() {
    chatContainer.style.display = chatContainer.style.display === "none" ? "flex" : "none";
  }

  function appendMessage(text, role) {
    const div = document.createElement("div");
    div.className = "message " + role;
    div.textContent = text;
    chatWindow.appendChild(div);
    chatWindow.scrollTop = chatWindow.scrollHeight;
  }

  async function sendMessage() {
	  const text = userInput.value.trim();
	  if (!text) return;

	  appendMessage(text, "user");
	  messages.push({ role: "user", content: text });
	  userInput.value = "";

	  // ❗️Обрезаем до 10 последних сообщений + system
	  const recent = messages.slice(0, 1).concat(messages.slice(-10));

	  try {
	    const res = await fetch("/chat/send", {
	      method: "POST",
	      headers: { "Content-Type": "application/json" },
	      body: JSON.stringify({ messages: recent })
	    });

	    const data = await res.json();
	    console.log("GPT ответ:", data);

	    if (data.choices && data.choices.length > 0) {
	      const reply = data.choices[0].message.content;
	      appendMessage(reply, "assistant");
	      messages.push({ role: "assistant", content: reply });
	    } else {
	      appendMessage("🤖 OpenAI не дал ответа", "assistant");
	    }
	  } catch (e) {
	    console.error("❌ Ошибка:", e);
	    appendMessage("❌ Ошибка соединения", "assistant");
	  }
	}

  function clearChat() {
    chatWindow.innerHTML = "";
    messages = [
      {
        role: "system",
        content: "Ты дружелюбный AI-ассистент. Помни контекст диалога и пиши вежливо. Добавляй эмодзи, если уместно."
      }
    ];
  }

  userInput.addEventListener("keydown", function (e) {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      sendMessage();
    }
  });
</script>