using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaseballLeague.Models;

namespace BaseballLeague.MVC.Models
{
    public class PlayersVM
    {
        public List<Player> Players { get; set; }
        public List<Team> Teams { get; set; }
        public List<SelectListItem> TeamsDropdown { get; set; }

        public PlayersVM(List<Player> playersList, List<Team> teamsList)
        {
            Players = playersList;
            TeamsDropdown = new List<SelectListItem>();

            foreach (var team in teamsList)
            {
                var st = new SelectListItem();

                st.Text = team.TeamName;
                st.Value = team.TeamID.ToString();

                TeamsDropdown.Add(st);
            }
        }
    }
}