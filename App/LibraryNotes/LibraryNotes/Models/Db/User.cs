using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes.Models
{
    public class User
    {
        public int Id { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string Adress { get; set; }
        public string Sex { get; set; }
        public string Phonenunmber { get; set; }
        public Metadata.AuthRoles Role { get; set; }
        public User(int id, string login, string password,
            string name, string adress, string sex, string phonenunmber, Metadata.AuthRoles Role)
        {
            this.Id = id;
            this.Login = login;
            this.Name = name;
            this.Name = name;
            this.Adress = adress;
            this.Sex = sex;
            this.Phonenunmber = phonenunmber;
            this.Role = Role;
        }

        public User() { }
    }
}
