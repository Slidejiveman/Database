using System;
using Dapper;
using System.Data.SqlClient;
using System.Collections.Generic;
using MvcEx4.Models;
using System.Data;
using System.Linq;

namespace MvcEx4.DB
{
    public static class Database
    {
        // Connection String used to connect to People Database in order to retrieve 
        // or send new information
        const string CONNECTION_STRING = @"Data Source=.\SQLEXPRESS;" +
                                         @"Initial Catalog=People;" +
                                         @"Integrated Security=True;" +
                                         @"Connect Timeout=15;" +
                                         @"Encrypt=False;" +
                                         @"TrustServerCertificate=True;" +
                                         @"ApplicationIntent=ReadWrite;" +
                                         @"MultiSubnetFailover=False";

        /// <summary>
        /// Create function inserts a new entity into the table.
        /// The ID numbers are auto-incremented when these are added
        /// to the database, so ID numbers are not inserted.
        /// </summary>
        /// <param name="person"> The Person to insert into database</param>
        /// <returns> An unused string that indicates success. </returns>
        public static string Create(Person person)
        {
            using (IDbConnection conn = new SqlConnection(CONNECTION_STRING))
            {
                conn.Execute("INSERT INTO People(FirstName, LastName, Phone, Email, Age)" +
                           "VALUES(@FirstName, @LastName, @Phone, @Email, @Age)",
                           new { person.FirstName, person.LastName, person.Phone, person.Email, person.Age });
                string result = "success";
                return result;
            }
        }

        /// <summary>
        /// A method used to fetch all entities in a database so that they
        /// may later be shown on the index screen.
        /// </summary>
        /// <returns> The list of people to be displayed </returns>
        public static List<Person> Read()
        {
            using (IDbConnection conn = new SqlConnection(CONNECTION_STRING))
            {
                return conn.Query<Person>("SELECT * FROM People").ToList();
            }
        }

        /// <summary>
        /// Reads one entity out of the database. This method is used as a
        /// helper in the HomeController to perform a few basic CRUD operations
        /// </summary>
        /// <param name="id"> The ID needed to collect correct entity </param>
        /// <returns> The desired entity from the database </returns>
        public static Person Find(int id)
        {
            using (IDbConnection conn = new SqlConnection(CONNECTION_STRING))
            {
                return conn.Query<Person>("SELECT * FROM People WHERE Id = @Id",
                                           new { id }).SingleOrDefault();
            }
        }

        /// <summary>
        /// Allows the user to modify values for entities already 
        /// extant in the database
        /// </summary>
        /// <param name="person"> The model containing updated attributes </param>
        /// <returns> 
        /// An int indicating the number of affected rows.
        /// This number should always be one with current implementation.
        /// </returns>
        public static int Update(Person person)
        {
            using (IDbConnection conn = new SqlConnection(CONNECTION_STRING))
            {
                int rowsAffected = conn.Execute("UPDATE People SET FirstName = @FirstName," +
                                                "LastName = @LastName," +
                                                "Phone = @Phone," +
                                                "Email = @Email," + 
                                                "Age = @Age " +
                                                "WHERE ID = @Id", person);
                return rowsAffected;
            }
        }

        /// <summary>
        /// Drops an entity from the database.
        /// </summary>
        /// <param name="person"> The model correlated with entity to drop </param>
        /// <returns> An unused string indicating successful deletion </returns>
        public static string Delete(Person person)
        {
            using (IDbConnection conn = new SqlConnection(CONNECTION_STRING))
            {
                conn.Execute("DELETE FROM People WHERE ID = @Id", new { person.Id });
                string result = "Deleted";
                return result;
            }
        }
    }
}