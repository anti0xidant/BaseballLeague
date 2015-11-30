using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BaseballLeague.BLL;
using BaseballLeague.Models;

namespace BaseballLeague.MVC.Controllers
{
    public class PlayerAPIController : ApiController
    {
        public List<Player> Get()
        {
            var ops = new BaseballBLL();
            var playerList = new List<Player>();
            playerList.AddRange(ops.GetNonFreeAgentPlayers());
            playerList.AddRange(ops.GetFreeAgents());

            return playerList;
        }

        public List<Player> Get(int teamId)
        {
            var ops = new BaseballBLL();

            return ops.GetTeamRoster(teamId);
        } 

        public HttpResponseMessage Post(Player newPlayer)
        {
            var ops = new BaseballBLL();
            ops.AddPlayer(newPlayer);

            var response = Request.CreateResponse(HttpStatusCode.Created, newPlayer);

            string uri = Url.Link("DefaultApi", new {id = newPlayer.PlayerID});
            response.Headers.Location = new Uri(uri);

            return response;
        }


    }
}
