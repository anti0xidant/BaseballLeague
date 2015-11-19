using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaseballLeague.Models;

namespace BaseballLeague.MVC.Models
{
    public class RosterViewModel
    {
        public List<Player>Players { get; set; }

        public RosterViewModel(List<Player>playerList )
        {
            Players = playerList;
        }
    }
}