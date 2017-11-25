using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes.Models
{
    class Order
    {
        public int id { get; set; }
        public int Book_Id { get; set; }
        public int User_Id { get; set; }
        public DateTime Order_date { get; set; }
        public DateTime Required_date { get; set; }
        public DateTime? Return_date { get; set; }
        public Order(int id, int Book_Id, int User_Id,
            DateTime Order_date, DateTime Required_date, DateTime? Return_date)
        {
            this.id = id;
            this.Book_Id = Book_Id;
            this.User_Id = User_Id;
            this.Order_date = Order_date;
            this.Required_date = Required_date;
            this.Return_date = Return_date;
        }

        public Order() { }
    }
}
