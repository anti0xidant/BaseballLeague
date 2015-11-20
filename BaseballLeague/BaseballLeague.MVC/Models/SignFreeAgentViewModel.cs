using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaseballLeague.Models;

namespace BaseballLeague.MVC.Models
{
    public class SignFreeAgentViewModel
    {
        public int TeamID { get; set; }
        public string TeamName { get; set; }
        public List<Player> FreeAgents { get; set; }

        public SignFreeAgentViewModel(int teamID, string teamName, List<Player> freeAgents)
        {
            TeamID = teamID;
            TeamName = teamName;
            FreeAgents = freeAgents;
        }

    }
}