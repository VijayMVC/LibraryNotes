using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes.Models
{
    class Author
    {
        public int Id { get; set; }
        public string First_Name { get; set; }
        public string Last_Name { get; set; }
        public DateTime Birth_date { get; set; }
        public DateTime? Die_date { get; set; }
        public Author(int id, string first_Name, string last_Name,
            DateTime birth_date, DateTime? Die_date, string sex, string phonenunmber)
        {
            this.Id = id;
            this.First_Name = first_Name;
            this.Last_Name = last_Name;
            this.Birth_date = birth_date;
            this.Die_date = Die_date;
        }

        public Author() { }
    }
}
