using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes.Models
{
    class Tag
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Tag(int id, string name, string adress)
        {
            this.Id = id;
            this.Name = name;
        }

        public Tag() { }
    }
}
