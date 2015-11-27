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

        public ActionResult PlayersOnTeam(int TeamID, string TeamName)
        {
            var RosterVM = new RosterViewModel(TeamID, TeamName);

            return View(RosterVM);
        }

        public ActionResult SignPlayer(int TeamID, int PlayerID, string TeamName)
        {
            var ops = new BaseballBLL();
            ops.TradePlayer(PlayerID, TeamID);

            return RedirectToAction("PlayersOnTeam", new {TeamID = TeamID, TeamName = TeamName});
        }

    }
}