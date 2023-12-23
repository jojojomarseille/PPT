require 'httparty'

class ChatGptService
  include HTTParty
  base_uri 'https://api.openai.com/v1/chat'

  def initialize(message)
    @options = {
      body:{
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content": "You are a helpful assistant."
          },
          {
            "role": "user",
            "content": "#{message}"
          }
        ]
      }.to_json,
      headers: {
        'Authorization' => "Bearer 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",
        'Content-Type' => 'application/json'
      }
    }
  end

  def chat
    self.class.post('/completions', @options)
  end

  private


end