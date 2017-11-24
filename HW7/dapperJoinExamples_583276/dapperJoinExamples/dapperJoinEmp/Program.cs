using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Data;
using System.Data.SqlClient;

// This shows simple examples showing one way of doing "joins" using Dapper
// This is using "multimapping" feature of Dapper. 
// An alternative is "QueryMultiple" (we'll look at that option later).
// 
// To test these examples, you will need a database named Employees, created with
// the script provided.

namespace dapperJoinEmp
{
    class Program
    {
        public static string connectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=Employees;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=True;ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        static void Main(string[] args)
        {

            Console.WriteLine("Simple query (no join):");
            List<Employee> basicEmps = basicEmployeeQuery();
            foreach (Employee e in basicEmps)
            {
                Console.WriteLine($"{e.Emp_Num}: {e.Emp_Lname} {e.Job_Code}");
            }

            Console.WriteLine("\n\nAll Employees (joined with Job):");
            List<Employee> emps = allEmployeesWithJob();
            foreach (Employee e in emps)
            {
                Console.WriteLine($"{e.Emp_Num}: {e.Emp_Lname} {e.Job.Job_Description}");
            }

            Console.WriteLine("\n\nOne Employee (joined with Job):");
            string empID = "102";
            Employee oneEmp = oneEmployeeWithJob(empID);
            if ( oneEmp != null)
            {
                Console.WriteLine($"employee num: {empID}");
                Console.WriteLine($"{oneEmp.Emp_Num}: {oneEmp.Emp_Lname} {oneEmp.Job.Job_Description}");
            }
            else
            {
                Console.WriteLine($"\nemployee num: {empID} not found.");
            }

            Console.WriteLine("\n\nOne Job (showing all employees with that job):");
            string jobCode = "501";
            Job job = getAJob(jobCode);
            if (job != null)
            {
                Console.WriteLine($"\nEmployees with the job {job.Job_Description}:");
                foreach (Employee e in job.Employees)
                {
                    Console.WriteLine($"\t{e.Emp_Lname}");
                }
            }
            else
            {
                Console.WriteLine("${jobCode} not found");
            }

            Console.WriteLine("\n\nAll Jobs (showing all employees with that job):");
            List<Job> jobs = getAllJobs();
            foreach (Job j in jobs)
            {
                Console.WriteLine($"\t{j.Job_Description}:");
                foreach (Employee e in j.Employees)
                {
                    Console.WriteLine($"\t\t{e.Emp_Lname}");
                }
            }
        }

        // Returns all employees (but Job property won't be populated)
        public static List<Employee> basicEmployeeQuery()
        {
            using (IDbConnection conn = new SqlConnection(connectionString))
            {
                return conn.Query<Employee>("Select * From Employee").AsList();
            }
        }

        // returns all employees, along with their job info (this does a one-to-one join)
        public static List<Employee> allEmployeesWithJob()
        {
            using (IDbConnection conn = new SqlConnection(connectionString))
            {
                string sql = @"select employee.*, job.job_code, job.JOB_DESCRIPTION from employee, job where employee.job_code = job.job_code";
                List < Employee > result = conn.Query<Employee, Job, Employee>(sql,
                    (e, j) =>
                    {
                        e.Job = j;
                        return e;
                    },
                    splitOn: "Job_Code"
                ).AsList();

                return result;
            }
        }

        // same as function above, but for only one employee (still doing a one-to-one join)
        public static Employee oneEmployeeWithJob(string emp_Num)
        {
            using (IDbConnection conn = new SqlConnection(connectionString))
            {
                string sql = @"select employee.*, job.job_code, job.JOB_DESCRIPTION 
                               from employee, job 
                               where employee.job_code = job.job_code and employee.emp_num = @Emp_Num";
                Employee result = conn.Query<Employee, Job, Employee>(sql,
                    (e, j) =>
                    {
                        e.Job = j;
                        return e;
                    },
                    new { Emp_Num = emp_Num },
                    splitOn: "Job_Code"
                ).FirstOrDefault();
                // FirstOrDefault will return null if list returned from Query() is empty

                return result;
            }
        }

        // Job is one-to-many with Employees. This gets a particular job, along
        // with a list of employees that have that job
        public static Job getAJob(string job_Code)
        {
            Job job = null;
            using (IDbConnection conn = new SqlConnection(connectionString))
            {
                string sql = @"Select Job.Job_Description, Employee.* from Job inner join Employee on Job.Job_Code = Employee.Job_Code
                               where Job.Job_Code = @Job_Code";

                var result = conn.Query<Job, Employee, Employee>(sql,
                                                        (j, e) =>
                                                        {
                                                            if (job == null)
                                                                job = j;
                                                            return e;
                                                        },
                                                        new { Job_Code = job_Code },
                                                        splitOn: "Emp_Num").AsList();
                if (job != null)
                    job.Employees = result;

            }
            return job;


        }

        // Same as above, except returning all jobs
        public static List<Job> getAllJobs()
        {
            var lookup = new Dictionary<string, Job>();
            using (IDbConnection conn = new SqlConnection(connectionString))
            {
                string sql = @"Select * from Job, Employee where Job.Job_Code = Employee.Job_Code";
                conn.Query<Job, Employee, Job>(sql, (j, e) =>
                {
                    Job job;
                    if (!lookup.TryGetValue(j.Job_Code, out job))
                    {
                        job = j;
                        lookup.Add(j.Job_Code, job);
                    }
                    if (job.Employees == null)
                        job.Employees = new List<Employee>();
                    job.Employees.Add(e);
                    return job;
                }, 
                splitOn: "Emp_Num");
            }
            return lookup.Values.ToList();

        }

    }
}
