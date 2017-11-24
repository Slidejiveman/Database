using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcEx4.Models
{
    /// <summary>
    /// The Person model that holds all of the data queried out of
    /// of sent back into the database.
    /// </summary>
    public class Person
    {

        public Person()
        {
            // No argument, empty constructor
        }

        public Person(int id, string firstName, string lastName, string phone, string email, int age)
        {
            this.Id = id;
            this.FirstName = firstName;
            this.LastName = lastName;
            this.Phone = phone;
            this.Email = email;
            this.Age = age;
        }

        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Phone { get; set; }

        public string Email { get; set; }

        public int Age { get; set; }

        // Preserved here in case needed later. 
        // The ToString function is considerably more useful when using files.
        public override string ToString()
        {
            return string.Format("{0},{1},{2},{3},{4},{5}", Id, FirstName, LastName, Phone, Email, Age);
        }
    }
}