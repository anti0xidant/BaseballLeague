using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using BaseballLeague.Models;

namespace BaseballLeague.MVC.Models
{
    public class TeamsViewModel
    {
        public List<Team> Teams { get; set; }
        public List<SelectListItem> Leagues { get; set; }

        public TeamsViewModel(List<Team> teamsList, List<League> leagueList)
        {

            Teams = teamsList;
            Leagues = new List<SelectListItem>();

            foreach (var league in leagueList)
            {
                var e = new SelectListItem();

                e.Text = league.LeagueName;
                e.Value = league.LeagueID.ToString();

                Leagues.Add(e);
            }

            
        }
    }
}