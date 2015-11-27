using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaseballLeague.Models;

namespace BaseballLeague.MVC.Models
{
    public class RosterViewModel
    {
        public int TeamID { get; set; }
        public string TeamName { get; set; }

        public RosterViewModel(int teamID, string teamName)
        {
            TeamID = teamID;
            TeamName = teamName;
        }
    }
}