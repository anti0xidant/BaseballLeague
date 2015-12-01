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
            playerList.AddRange(ops.GetAllPlayers());
            playerList.AddRange(ops.GetFreeAgents());
            var result = playerList.OrderBy(player => player.TeamName).ThenBy(player => player.JerseyNumber).ToList();
            foreach (var player in result.Where(player => player.TeamID == 0))
            {
                player.TeamID = 1;
            }

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

        public HttpResponseMessage Delete(int id)
        {
            var ops = new BaseballBLL();
            ops.DeletePlayer(id);

            var response = Request.CreateResponse(HttpStatusCode.OK, id);

            string uri = Url.Link("DefaultApi", new {id});
            response.Headers.Location = new Uri(uri);

            return response;
        }
    }
}
