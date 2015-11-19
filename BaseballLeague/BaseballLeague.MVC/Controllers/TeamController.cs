using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaseballLeague.BLL;
using BaseballLeague.MVC.Models;

namespace BaseballLeague.MVC.Controllers
{
    public class TeamController : Controller
    {
        // GET: Team
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult PlayersOnTeam(int TeamID = 2)
        {
            var ops = new BaseballBLL();
            var players = ops.GetTeamRoster(TeamID);
            var RosterVM = new RosterViewModel(players);

            return View(RosterVM);
        }
    }
}