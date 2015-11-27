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
    public class TeamAPIController : ApiController
    {
        #region Team Index Page
        [HttpGet]
        [ActionName("GetAllTeams")]
        public List<Team> GetAllTeams()
        {
            var ops = new BaseballBLL();
            return ops.GetTeams();
        }

        [HttpPost]
        [ActionName("PostNewTeam")]
        public HttpResponseMessage Post(Team newTeam)
        {
            var ops = new BaseballBLL();
            ops.AddTeam(newTeam);

            var response = Request.CreateResponse(HttpStatusCode.Created, newTeam);

            string uri = Url.Link("DefaultApi", new { id = newTeam.TeamID });
            response.Headers.Location = new Uri(uri);

            return response;

        }

        #endregion

        #region Sign FreeAgent Modal

        [HttpGet]
        [ActionName("GetFreeAgents")]
        public List<Player> GetFreeAgents()
        {
            var ops = new BaseballBLL();

            return ops.GetFreeAgents();
        }

        #endregion
    }
    
}
