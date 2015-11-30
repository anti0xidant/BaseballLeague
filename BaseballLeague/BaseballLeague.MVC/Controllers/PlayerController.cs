using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaseballLeague.BLL;
using BaseballLeague.Models;
using BaseballLeague.MVC.Models;

namespace BaseballLeague.MVC.Controllers
{
    public class PlayerController : Controller
    {
        // GET: Player
        public ActionResult Index()
        {
            var ops = new BaseballBLL();
            var playerList = new List<Player>();
            playerList.AddRange(ops.GetNonFreeAgentPlayers());
            playerList.AddRange(ops.GetFreeAgents());
            var result = playerList.OrderBy(player => player.TeamName).ThenBy(player => player.JerseyNumber).ToList();
            foreach (var player in result.Where(player => player.TeamID == 0))
            {
                player.TeamID = 1;
            }

            var teams = ops.GetTeamDropDown();
            
            var vm = new PlayersVM(result, teams);
            
            return View(vm);
        }

        public ActionResult _AddPlayerModal()
        {
            var ops = new BaseballBLL();
            var vm = new AddPlayerModalVM(ops.GetTeamDropDown(), ops.GetPositionDropDown());

            return PartialView(vm);
        }

        public ActionResult _DeletePlayerModal()
        {
            return PartialView();
        }
    }
}