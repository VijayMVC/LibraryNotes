using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes.Models
{
    class Books
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Year { get; set; }
        public int Author_Id { get; set; }
        public string Description { get; set; }
        public Books(int id, string name, int Year,
            int Author_Id, string Description)
        {
            this.Id = id;
            this.Name = name;
            this.Year = Year;
            this.Author_Id = Author_Id;
            this.Description = Description;
        }
    }
}
