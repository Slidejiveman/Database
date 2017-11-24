using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcEx4.Models;
using MvcEx4.DB;

// @Authors:
// Chance Turner, Ryder Dale Walton

namespace MvcEx4.Controllers
{
    public class HomeController : Controller
    {
        /// <summary>
        /// Reads all of the entities from the database
        /// and displays them on screen for the user.
        /// </summary>
        /// <returns> The index view containing all People </returns>
        public ActionResult Index()
        {
            List<Person> People = Database.Read();

            return View(People);
        }

        /// <summary>
        /// Fetches a writable view containing the 
        /// populated fields related to a Person in
        /// the database
        /// </summary>
        /// <param name="Id"> Used to query database </param>
        /// <returns> Writable view of Person's attribute values </returns>
        public ActionResult Edit(int Id)
        {
            Person person = Database.Find(Id);

            return View(person);
        }

        /// <summary>
        /// Updates the database with any changes associated
        /// with a found Person's attribute values.
        /// </summary>
        /// <param name="per">
        /// The Person carrying potentially new data from user
        /// </param>
        /// <returns> Redirects user back to site incex </returns>
        [HttpPost]
        public ActionResult Edit(Person per)
        {

            Database.Update(per);

            return RedirectToAction("Index");
        }

        /// <summary>
        /// Gets the current values of attributes
        /// associated with a person. The current
        /// values are displayed so the user may see them.
        /// </summary>
        /// <param name="Id"> Used to query database </param>
        /// <returns> A read-only view with desired person. </returns>
        public ActionResult Details(int Id)
        {

            Person person = Database.Find(Id);

            return View(person);
        }

        /// <summary>
        /// This Action deletes an item from the database
        /// without any prompt screen and then redirects the
        /// user to the index page of the site.
        /// </summary>
        /// <param name="Id"> 
        /// Requires the Person ID to locate
        /// the Person in the database
        /// </param>
        /// <returns> Redirects user to site index </returns>
        public ActionResult Delete(int Id)
        {

            Person person = Database.Find(Id);
            Database.Delete(person); 

            return RedirectToAction("Index");

        }

        /// <summary>
        /// The controller first needs to get the Create view with 
        /// empty fields. This allows the user to populate the fields
        /// with good data to send back to the database. 
        /// </summary>
        /// <returns> Create View with empty Person </returns>
        public ActionResult Create()
        {
            // Create an empty Person model
            Person person = new Person();
            
            return View(person);
        }

        /// <summary>
        /// The HttpPost version of this create method sends
        /// the newly instantiated person to the database
        /// for storage.
        /// </summary>
        /// <param name="per"> The instantiated person </param>
        /// <returns> Redirects the user back to site index </returns>
        [HttpPost]
        public ActionResult Create(Person per)
        {
            Database.Create(per);

            return RedirectToAction("Index");
        }
    }
}