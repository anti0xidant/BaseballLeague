using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BaseballLeague.BLL;
using BaseballLeague.MVC.Models;

namespace BaseballLeague.MVC.Controllers
{
    public class PlayerController : Controller
    {
        // GET: Player
        public ActionResult Index()
        {
            var ops = new BaseballBLL();
            var players = ops.GetNonFreeAgentPlayers();
            var teams = ops.GetTeamDropDown();
            
            var vm = new PlayersVM(players, teams);
            
            return View(vm);
        }

        public ActionResult _AddPlayerModal()
        {
            var ops = new BaseballBLL();
            var vm = new AddPlayerModalVM(ops.GetTeamDropDown(), ops.GetPositionDropDown());

            return PartialView(vm);
        }
    }
}