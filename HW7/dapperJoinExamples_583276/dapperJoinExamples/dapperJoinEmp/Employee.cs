using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dapperJoinEmp
{
    class Employee
    {
        public string Emp_Num { get; set; }
        public string Emp_Lname { get; set; }
        public string Emp_Fname { get; set; }
        public string Emp_Initial { get; set; }
        public DateTime Emp_HireDate { get; set; }
        public string Job_Code { get; set; }
        public int Emp_Years { get; set; }

        public Job Job { get; set; }
    }
}
