namespace Notes.Views;

public partial class AboutPage : ContentPage
{
    public AboutPage()
    {
        InitializeComponent();
    }

    // need to search about signature. 
    private async void LearnMore_Clicked(object sender, EventArgs e)
    {
        if (BindingContext is Models.About about2)
        {
            // Navigate to the specified URL in the system browser.
            await Launcher.Default.OpenAsync(about2.MoreInfoUrl);
        }
    }
}