using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dapperJoinEmp
{
    class Job
    {
        public string Job_Code { get; set; }
        public string Job_Description { get; set; }

        public float Job_Chg_Hour { get; set; }

        public DateTime Job_Last_Update { get; set; }

        public List<Employee> Employees;
    }
}
