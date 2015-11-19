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
    }
}