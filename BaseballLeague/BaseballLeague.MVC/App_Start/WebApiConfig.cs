using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Net.Http;
namespace BaseballLeague.MVC
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Routes.MapHttpRoute(
                name: "FreeAgentApi",
                routeTemplate: "api/{controller}/{TeamID}/{PlayerID}",
                defaults: new {TeamID = RouteParameter.Optional, PlayerID = RouteParameter.Optional}
                );
        }
    }
}
