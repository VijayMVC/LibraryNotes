using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes.Models
{
    class Tags
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Tags(int id, string name, string adress)
        {
            this.Id = id;
            this.Name = name;
        }
    }
}
