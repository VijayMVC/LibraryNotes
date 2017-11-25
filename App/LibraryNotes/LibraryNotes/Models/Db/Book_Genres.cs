using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes.Models
{
    class Book_Genres
    {
        public int Id { get; set; }
        public int Book_id { get; set; }
        public int Genre_id { get; set; }
        public Book_Genres(int id, int book_id, int genre_id)
        {
            this.Id = id;
            this.Book_id = book_id;
            this.Genre_id = genre_id;
        }

        public Book_Genres() { }
    }
}
