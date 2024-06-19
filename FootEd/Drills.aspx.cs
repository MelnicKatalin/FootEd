using System;
using System.Collections.Generic;

namespace FootEd
{
    public partial class Drills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDrills();
            }
        }

        private void LoadDrills()
        {
            var drills = new List<Drill>
        {
            new Drill { Id = 1, Name = "Passing Drill", ImageUrl = "images/passing_drill.jpg" },
            new Drill { Id = 2, Name = "Shooting Drill", ImageUrl = "images/shooting_drill.jpg" },
            new Drill { Id = 3, Name = "Dribbling Drill", ImageUrl = "images/dribbling_drill.jpg" },
            new Drill { Id = 4, Name = "Defensive Drill", ImageUrl = "images/defensive_drill.jpg" },
            new Drill { Id = 5, Name = "Goalkeeping Drill", ImageUrl = "images/goalkeeping_drill.jpg" },
            new Drill { Id = 6, Name = "Fitness Drill", ImageUrl = "images/fitness_drill.jpg" },
            new Drill { Id = 7, Name = "Tactical Drill", ImageUrl = "images/tactical_drill.jpg" },
            new Drill { Id = 8, Name = "Set Piece Drill", ImageUrl = "images/set_piece_drill.jpg" }
        };

            drillsRepeater.DataSource = drills;
            drillsRepeater.DataBind();
        }
    }

    public class Drill
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ImageUrl { get; set; }
    }
}