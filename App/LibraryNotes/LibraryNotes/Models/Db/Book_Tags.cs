using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes.Models
{
    class Book_Tags
    {
        public int Id { get; set; }
        public int Book_id { get; set; }
        public int Tag_id { get; set; }
        public Book_Tags(int id, int book_id, int tag_id)
        {
            this.Id = id;
            this.Book_id = book_id;
            this.Tag_id = tag_id;
        }

        public Book_Tags() { }
    }
}
