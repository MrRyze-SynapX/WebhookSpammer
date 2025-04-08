using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;

namespace WebhookSpammer
{
    public partial class MainWindow : Window
    {
        private readonly HttpClient _httpClient = new HttpClient();
        private CancellationTokenSource _cancellationTokenSource;

        public MainWindow()
        {
            InitializeComponent();
        }

        private async void SendButton_Click(object sender, RoutedEventArgs e)
        {
            string webhookUrl = WebhookUrlTextBox.Text.Trim();
            string message = MessageTextBox.Text.Trim();

            if (string.IsNullOrEmpty(webhookUrl) || string.IsNullOrEmpty(message))
            {
                MessageBox.Show("Webhook URL und Nachricht dürfen nicht leer sein.");
                return;
            }

            // Überprüfe, ob der Webhook erreichbar ist
            if (!await TestWebhook(webhookUrl))
            {
                MessageBox.Show("Webhook ist ungültig oder offline.");
                return;
            }

            // Verhindere Mehrfach-Klicks
            SendButton.IsEnabled = false;
            _cancellationTokenSource = new CancellationTokenSource();

            _ = Task.Run(async () =>
            {
                while (!_cancellationTokenSource.IsCancellationRequested)
                {
                    try
                    {
                        var payload = new { content = message };
                        var json = JsonSerializer.Serialize(payload);
                        var content = new StringContent(json, Encoding.UTF8, "application/json");

                        var response = await _httpClient.PostAsync(webhookUrl, content, _cancellationTokenSource.Token);

                        // Bei Rate-Limit kurz warten
                        if ((int)response.StatusCode == 429)
                        {
                            await Task.Delay(1000, _cancellationTokenSource.Token);
                            continue;
                        }

                        if (!response.IsSuccessStatusCode)
                        {
                            Dispatcher.Invoke(() =>
                            {
                                MessageBox.Show($"Fehler beim Senden: {response.StatusCode}");
                                StopSending();
                            });
                            return;
                        }

                        // Pause zwischen Nachrichten
                        await Task.Delay(100, _cancellationTokenSource.Token);
                    }
                    catch (TaskCanceledException)
                    {
                        break;
                    }
                    catch (Exception ex)
                    {
                        Dispatcher.Invoke(() =>
                        {
                            MessageBox.Show("Fehler: " + ex.Message);
                            StopSending();
                        });
                        break;
                    }
                }
            });
        }

        // Its from ChatGpt btw
        // Es ist von ChatGpt 

        private void StopButton_Click(object sender, RoutedEventArgs e)
        {
            StopSending();
        }

        private void StopSending()
        {
            _cancellationTokenSource?.Cancel();
            Dispatcher.Invoke(() =>
            {
                SendButton.IsEnabled = true;
            });
        }

        // Testet den Webhook mit einem GET-Request.
        private async Task<bool> TestWebhook(string url)
        {
            try
            {
                var response = await _httpClient.GetAsync(url);
                return response.IsSuccessStatusCode;
            }
            catch
            {
                return false;
            }
        }
    }
}
