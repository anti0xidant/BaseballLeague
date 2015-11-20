using BaseballLeague.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BaseballLeague.MVC.Models
{
    public class AddPlayerModalVM
    {
        public List<SelectListItem> Teams { get; set; }
        public List<SelectListItem> PrimaryPositions { get; set; }
        public List<SelectListItem> SecondaryPositions { get; set; }

        public AddPlayerModalVM(List<Team> teamsList, List<Position> positionsList)
        {
            Teams = new List<SelectListItem>();

            foreach (var team in teamsList)
            {
                var st = new SelectListItem();

                st.Text = team.TeamName;
                st.Value = team.TeamID.ToString();

                Teams.Add(st);
            }

            PrimaryPositions = new List<SelectListItem>();
            SecondaryPositions = new List<SelectListItem>();

            foreach (var position in positionsList)
            {
                var sp = new SelectListItem();

                sp.Text = position.PositionName;
                sp.Value = position.PositionID.ToString();

                PrimaryPositions.Add(sp);
                SecondaryPositions.Add(sp);
            }
        }
    }
}