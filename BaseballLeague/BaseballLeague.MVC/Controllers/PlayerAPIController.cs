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
            var ops = new BaseballLeagueOperations();
            var players = ops.GetAllPlayers();

            return players;
        }

        public List<Player> Get(int id)
        {
            var ops = new BaseballLeagueOperations();
            var players = ops.GetPlayersByTeam(id);

            return players;
        }

        public HttpResponseMessage Post(Player newPlayer)
        {
            var ops = new BaseballLeagueOperations();
            ops.AddPlayer();                                                 // TODO Add fields from model

            var response = Request.CreateResponse(HttpStatusCode.Created, newPlayer);

            string uri = Url.Link("DefaultApi", new { id = newPlayer.PlayerID });
            response.Headers.Location = new Uri(uri);

            return response;
        } 
    }
}
