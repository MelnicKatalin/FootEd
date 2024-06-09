using System;
using System.Collections.Generic;


public partial class DrillDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int drillId = int.Parse(Request.QueryString["id"]);
            LoadDrillDetails(drillId);
        }
    }

    private void LoadDrillDetails(int id)
    {
        // Example data; replace with actual data source
        var drills = new List<Drills>
        {
            new Drills { Id = 1, Name = "Passing Drill", Description = "Improves passing accuracy", Duration = "20 mins", ImageUrl = "images/passing_drill.jpg" },
            new Drills { Id = 2, Name = "Shooting Drill", Description = "Enhances shooting skills", Duration = "15 mins", ImageUrl = "images/shooting_drill.jpg" },
            new Drills { Id = 3, Name = "Dribbling Drill", Description = "Increases dribbling speed", Duration = "25 mins", ImageUrl = "images/dribbling_drill.jpg" },
            // Add more drills as needed
        };

        var drill = drills.Find(d => d.Id == id);
        if (drill != null)
        {
            drillName.Text = drill.Name;
            drillDescription.Text = drill.Description;
            drillDuration.Text = drill.Duration;
            drillImage.Attributes["src"] = drill.ImageUrl;
        }
    }
}

public partial class Drills
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public string Duration { get; set; }
    public string ImageUrl { get; set; }
}
