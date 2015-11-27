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
            var ops = new BaseballBLL();
            var teams = ops.GetTeams();
            var leagues = ops.GetLeagueDropDown();
            
            var teamVM = new TeamsViewModel(teams, leagues);
           
            return View(teamVM);
        }

        public ActionResult PlayersOnTeam(int TeamID, string TeamName)
        {
            var RosterVM = new RosterViewModel(TeamID, TeamName);

            return View(RosterVM);
        }

        public ActionResult _AddTeamModal()
        {
            var ops = new BaseballBLL();
            var leagues = ops.GetLeagueDropDown();

            return PartialView(leagues);
        }


        public ActionResult _SignFreeAgentModal(int TeamID, string TeamName)
        {
            var ops = new BaseballBLL();
            var freeAgents = ops.GetFreeAgents();

            var FreeAgentVM = new SignFreeAgentViewModel(TeamID, TeamName, freeAgents);

            return PartialView(FreeAgentVM);
        }

        public ActionResult _TradePlayerModal()
        {
            var ops = new BaseballBLL();
            var teams= ops.GetTeams();

            var tradePlayerVM = new TradePlayerViewModel(teams);

            return PartialView(tradePlayerVM);
        }

        public ActionResult SignPlayer(int TeamID, int PlayerID, string TeamName)
        {
            var ops = new BaseballBLL();
            ops.TradePlayer(PlayerID, TeamID);

            return RedirectToAction("PlayersOnTeam", new {TeamID = TeamID, TeamName = TeamName});
        }

    }
}