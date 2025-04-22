package com.ict.common;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;

@Controller
public class ChatController {

    private static final String API_KEY = ""; // Твой OpenAI API-ключ
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String MODEL = "gpt-4o-mini";

    @PostMapping(value = "/chat/send", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public String sendMessage(HttpServletRequest request) {
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = request.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) sb.append(line);
        } catch (Exception e) {
            return "{\"error\": \"Ошибка чтения тела запроса\"}";
        }

        JsonObject inputJson = JsonParser.parseString(sb.toString()).getAsJsonObject();
        JsonArray messages = inputJson.getAsJsonArray("messages");

        JsonObject payload = new JsonObject();
        payload.addProperty("model", MODEL);
        payload.add("messages", messages);
        payload.addProperty("temperature", 0.7);
        payload.addProperty("max_tokens", 500);

        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            HttpPost httpPost = new HttpPost(API_URL);
            httpPost.setHeader("Authorization", "Bearer " + API_KEY);
            httpPost.setHeader("Content-Type", "application/json");
            httpPost.setEntity(new StringEntity(payload.toString(), "UTF-8"));

            CloseableHttpResponse response = httpClient.execute(httpPost);
            String result = EntityUtils.toString(response.getEntity());
            System.out.println("✅ GPT ответ: " + result);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"error\": \"" + e.getClass().getSimpleName() + ": " + e.getMessage() + "\"}";
        }
    }
}