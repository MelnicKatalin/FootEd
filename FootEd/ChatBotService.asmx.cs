using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace FootEd
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    public class ChatBotService : WebService
    {
        private static readonly HttpClient client = new HttpClient();
        private string apiKey = "YOUR_OPENAI_API_KEY";

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public async Task<string> SendMessage(string message)
        {
            string apiUrl = "https://api.openai.com/v1/chat/completions";

            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Add("Authorization", $"Bearer {apiKey}");
            client.DefaultRequestHeaders.Add("User-Agent", "OpenAI-ChatGPT-Client");

            var content = new StringContent(
                $"{{ \"messages\": [{{ \"role\": \"system\", \"content\": \"You are a helpful assistant.\" }}, {{ \"role\": \"user\", \"content\": \"{message}\" }}], \"model\": \"gpt-3.5-turbo-0613\" }}",
                Encoding.UTF8,
                "application/json");

            var response = await client.PostAsync(apiUrl, content);
            var responseContent = await response.Content.ReadAsStringAsync();

            if (response.IsSuccessStatusCode)
            {
                var responseObj = JObject.Parse(responseContent);
                string assistantResponse = responseObj["choices"][0]["message"]["content"].ToString();
                return assistantResponse;
            }
            else
            {
                return "Error: " + response.StatusCode.ToString();
            }
        }
    }
}   
