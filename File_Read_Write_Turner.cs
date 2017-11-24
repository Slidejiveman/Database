const string FILE_PATH = @"C:\Users\rdnot\Desktop\MvcEx4\MvcEx4\App_Data\People.csv";

public static List<Person> Read()
        {
            List<Person> people = new List<Person>();


            string line;

            // Read the file and display it line by line.
            System.IO.StreamReader file = new System.IO.StreamReader(FILE_PATH);

            while ((line = file.ReadLine()) != null)
            {
                string[] items = line.Split(',');

                Person temp = new Person(
                    Convert.ToInt32(items[0]), items[1], items[2],
                    items[3], items[4], Convert.ToInt32(items[5]));

                people.Add(temp);
            }

            file.Close();

            return people;
        }

        public static void Write(List<Person> people)
        {
            using (System.IO.StreamWriter file =
                new System.IO.StreamWriter(FILE_PATH))
            {
                foreach (Person p in people)
                {
                    file.WriteLine(p.ToString());
                }
            }
        }