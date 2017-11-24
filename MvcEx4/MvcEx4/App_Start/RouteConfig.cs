using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MvcEx4
{
    public class RouteConfig
    {
        /// <summary>
        /// RegisterRoutes sets up the MVC framework so that the
        /// controller understands how to interpret the use of RESTful URIs.
        /// This also sets up the Index as the default page and the HomeController
        /// as its controller.
        /// </summary>
        /// <param name="routes"> The collection of routes </param>
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
