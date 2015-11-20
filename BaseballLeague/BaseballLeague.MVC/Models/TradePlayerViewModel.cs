using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BaseballLeague.Models;

namespace BaseballLeague.MVC.Models
{
    public class TradePlayerViewModel
    {
        public List<Team> Teams { get; set; }

        public TradePlayerViewModel(List<Team> teams)
        {
            Teams = teams;
        }
    }
}